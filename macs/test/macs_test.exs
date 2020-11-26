defmodule MacsTest do
  use ExUnit.Case
  doctest Macs

  test "greets the world" do
    assert Macs.hello() == :world
  end
end
