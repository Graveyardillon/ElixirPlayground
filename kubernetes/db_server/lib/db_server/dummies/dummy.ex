defmodule DbServer.Dummies.Dummy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dummy" do
    field :data, :string

    timestamps()
  end

  @doc false
  def changeset(dummy, attrs) do
    dummy
    |> cast(attrs, [:data])
    |> validate_required([:data])
  end
end
