defmodule DbServer.Repo.Migrations.CreateDummy do
  use Ecto.Migration

  def change do
    create table(:dummy) do
      add :data, :string

      timestamps()
    end

  end
end
