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
end