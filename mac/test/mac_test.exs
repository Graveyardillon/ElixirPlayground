defmodule MacTest do
  use ExUnit.Case

  require Mac.Assertions
  alias Mac.Assertions
  
  test "assert test" do
    assert 1 == 2, "1 is not 2"
  end

  test "assert test2" do
    assert 1 = 2, "1 is not 2"
  end

  test "my assert test" do
    Assertions.my_assert 1 == 2, "1 is not 2"
  end

  test "my assert test2" do
    Assertions.my_assert 1 = 2, "1 is not 2"
  end
end
