defmodule Macs do
  @moduledoc """
  Documentation for `Macs`.
  """

  defmacro myif({_, _, [_left, right]} = condition, clauses) when is_binary(right) do
    IO.inspect("Right is binary")

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

   defmacro myif({_, _, [_left, right]} = condition, clauses) when is_integer(right) do
    IO.inspect("Right is integer")

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

  defmacro myif(condition, clauses) do
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
end

defmodule MacsRunner do
  @moduledoc """
  Runner of Mac module
  """

  require Macs

  #Macs.myif "Hello"=="World", do: IO.inspect("hello"), else: IO.inspect("else clause OMG")
  Macs.myif 1 == 2, do: IO.inspect("do clause"), else: IO.inspect("else clause")
end
