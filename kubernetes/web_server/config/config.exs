# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :web_server,
  ecto_repos: [WebServer.Repo]

# Configures the endpoint
config :web_server, WebServerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ae1wPYiXd5zkn214pEakOKcO5JWr0C2HtNSx/CdwE1S3QX9VEONp1BussDUyhyLb",
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
