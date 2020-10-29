defmodule DbServer.DummiesTest do
  use DbServer.DataCase

  alias DbServer.Dummies

  describe "dummy" do
    alias DbServer.Dummies.Dummy

    @valid_attrs %{data: "some data"}
    @update_attrs %{data: "some updated data"}
    @invalid_attrs %{data: nil}

    def dummy_fixture(attrs \\ %{}) do
      {:ok, dummy} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Dummies.create_dummy()

      dummy
    end

    test "list_dummy/0 returns all dummy" do
      dummy = dummy_fixture()
      assert Dummies.list_dummy() == [dummy]
    end

    test "get_dummy!/1 returns the dummy with given id" do
      dummy = dummy_fixture()
      assert Dummies.get_dummy!(dummy.id) == dummy
    end

    test "create_dummy/1 with valid data creates a dummy" do
      assert {:ok, %Dummy{} = dummy} = Dummies.create_dummy(@valid_attrs)
      assert dummy.data == "some data"
    end

    test "create_dummy/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dummies.create_dummy(@invalid_attrs)
    end

    test "update_dummy/2 with valid data updates the dummy" do
      dummy = dummy_fixture()
      assert {:ok, %Dummy{} = dummy} = Dummies.update_dummy(dummy, @update_attrs)
      assert dummy.data == "some updated data"
    end

    test "update_dummy/2 with invalid data returns error changeset" do
      dummy = dummy_fixture()
      assert {:error, %Ecto.Changeset{}} = Dummies.update_dummy(dummy, @invalid_attrs)
      assert dummy == Dummies.get_dummy!(dummy.id)
    end

    test "delete_dummy/1 deletes the dummy" do
      dummy = dummy_fixture()
      assert {:ok, %Dummy{}} = Dummies.delete_dummy(dummy)
      assert_raise Ecto.NoResultsError, fn -> Dummies.get_dummy!(dummy.id) end
    end

    test "change_dummy/1 returns a dummy changeset" do
      dummy = dummy_fixture()
      assert %Ecto.Changeset{} = Dummies.change_dummy(dummy)
    end
  end
end
