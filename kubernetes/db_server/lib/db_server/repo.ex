defmodule DbServer.Repo do
  use Ecto.Repo,
    otp_app: :db_server,
    adapter: Ecto.Adapters.Postgres
end
