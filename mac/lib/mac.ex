defmodule Mac do
  defmodule Test do
    @moduledoc """
    A struct that keeps information about the test.

    It is received by formatters and contains the following fields:

      * `:name` - the test name
      * `:module` - the test module
      * `:state` - the finished test state (see `t:ExUnit.state/0`)
      * `:time` - the duration in microseconds of the test's runtime
      * `:tags` - the test tags
      * `:logs` - the captured logs

    """
    defstruct [:name, :case, :module, :state, time: 0, tags: %{}, logs: ""]

    # TODO: Remove the `:case` field on v2.0
    @type t :: %__MODULE__{
            name: atom,
            case: module,
            module: module,
            state: Mac.state(),
            time: non_neg_integer,
            tags: map,
            logs: String.t()
          }
  end

  defmacro macro(param) do
    IO.inspect(param)
  end

  # Outputs
  #   "aaa"
  #   "bbb"
  defmacro macro(param1, param2) do
    IO.inspect(param1)
    IO.inspect(param2)
  end

  defmacro my_if(condition, clauses) do
    IO.inspect(condition, label: :conditions)
    IO.inspect(clauses, label: :clauses)
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

defmodule Mac.Runner do
  require Mac
  require Mac.Assertions

  #Mac.my_if 1 = 1, do: IO.inspect("1 is 1"), else: IO.inspect("1 is not 1")
  #Mac.my_if 1 = 2, do: IO.inspect("1 is 2"), else: IO.inspect("1 is not 2")
  #Mac.Assertions.my_assert(1 = 2, message: "error")
  #Mac.Assertions.macro(1 = 2)
  #Mac.macro("aaa", "bbb")
end