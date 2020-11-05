# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :web_server,
  ecto_repos: [WebServer.Repo]
config :web_server, WebServer.Repo,
  database: "db",
  username: "postgres",
  password: "postgres",
  socket_dir: "/tmp/cloudsql/e-players-293208:asia-northeast1:dummy-db",
  port: "5432"

# Configures the endpoint
config :web_server, WebServerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HgTL3ih7BZTz3B1wk+KJw5anKM/OPBLmMtmt5825QYsocP/53Lrzy0Z/IwgQ3pEi",
  render_errors: [view: WebServerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: WebServer.PubSub,
  live_view: [signing_salt: "q/iJBjY6"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :web_server, :db_domain_url, "http://35.185.146.60"

