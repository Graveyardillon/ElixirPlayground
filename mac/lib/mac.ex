defmodule AssertionError do
  @no_value :ex_unit_no_meaningful_value

  defexception left: @no_value,
               right: @no_value,
               message: @no_value,
               expr: @no_value,
               args: @no_value,
               doctest: @no_value,
               context: :==

  def no_value do
    @no_value
  end

  def message do
    "msg"
  end
end

defmodule Mac do
  @moduledoc """
  Documentation for Mac.
  """

  defmacro macro(param) do
    IO.inspect(param)
    quote do: IO.inspect(unquote(param))
  end

  defmacro my_if(condition, clauses) do
    do_clause = Keyword.get(clauses, :do, nil)
    else_clause = Keyword.get(clauses, :else, nil)
    
    quote do
      case unquote(condition) do
        x when x in [false, nil] ->
          unquote(else_clause)
        _ ->
          unquote(do_clause)
      end
    end
  end

  defmacro my_assert(assertion) do 
    #IO.inspect(assertion)
    if translated = translate_assertion(:assert, assertion, __CALLER__) do
      IO.inspect(translated)
    else
      IO.inspect("Assertion error")
    end
  end

  @operator [:==, :<, :>, :<=, :>=, :===, :=~, :!==, :!=, :in]

  defp translate_assertion(:assert, {operator, meta, [_, _]} = expr, caller)
       when operator in @operator do
    left = {:left, [], __MODULE__}
    right = {:right, [], __MODULE__}
    call = {operator, meta, [left, right]}
    equality_check? = operator in [:<, :>, :!==, :!=]
    message = "Assertion with #{operator} failed"
    translate_operator(:assert, expr, call, message, equality_check?, caller)
  end

  defp translate_assertion(_kind, _expected, _caller) do
    nil
  end

  defp translate_operator(kind, {op, meta, [left, right]} = expr, call, message, true, _caller) do
    expr = escape({kind, meta, [expr]}, [prune_metadata: true])
    context = if op in [:===, :!==], do: :===, else: :==

    quote do
      left = unquote(left)
      right = unquote(right)

      if left === right do
        Mac.assert(false,
          left: left,
          expr: unquote(expr),
          message: unquote(message <> ", both sides are exactly equal")
        )
      else
        Mac.assert(unquote(call),
          left: left,
          right: right,
          expr: unquote(expr),
          message: unquote(message),
          context: unquote(context)
        )
      end
    end
  end

  defp translate_operator(kind, {op, meta, [left, right]} = expr, call, message, false, _caller) do
    expr = escape({kind, meta, [expr]}, prune_metadata: true)
    context = if op in [:===, :!==], do: :===, else: :==

    quote do
      left = unquote(left)
      right = unquote(right)

      Mac.assert(unquote(call),
        left: left,
        right: right,
        expr: unquote(expr),
        message: unquote(message),
        context: unquote(context)
      )
    end
  end

  defp escape(expr, opts \\ []) do
    unquote = Keyword.get(opts, :unquote, false)
    kind = if Keyword.get(opts, :prune_metadata, false), do: :prune_metadata, else: :default
    :elixir_quote.escape(expr, kind, unquote)
  end

  def assert(value, message) when is_binary(message) do
    assert(value, message: message)
  end

  def assert(value, opts) when is_list(opts) do
    unless value, do: raise(AssertionError, opts)
    true
  end
end

defmodule MacTest do
  require Mac

  Mac.my_assert 2 == 2
end