# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :db_server,
  ecto_repos: [DbServer.Repo]
config :db_server, DbServer.Repo,
  database: "db",
  username: "postgres",
  password: "postgres",
  socket_dir: "/tmp/cloudsql/e-players-293208:asia-northeast1:dummy-db",
  port: "5432"

# Configures the endpoint
config :db_server, DbServerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BWvdIMN7nUc72/hDIX4yPt0yRf+h1L+rUDE23//KsAT/e34gJs4yARbDQ92zN0W7",
  render_errors: [view: DbServerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DbServer.PubSub,
  live_view: [signing_salt: "A2Ak29zE"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
