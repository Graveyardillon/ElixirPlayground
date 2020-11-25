defmodule MacTest do
  use ExUnit.Case
  
  test "assert test" do
    assert 1 == 2, "1 is not 2"
  end

  test "assert test2" do
    assert 1 = 2, "1 is not 2"
  end

  test "assert test3" do
    a = 3
    assert a = 5, "a = 5"
  end
end
