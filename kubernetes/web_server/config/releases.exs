# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
#use Mix.Config

import Config

# database_url =
#   System.get_env("DATABASE_URL") ||
#     raise """
#     environment variable DATABASE_URL is missing.
#     For example: ecto://USER:PASS@HOST/DATABASE
#     """

# config :web_server, WebServer.Repo,
#   # ssl: true,
#   url: database_url,
#   pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

# secret_key_base =
#   System.get_env("SECRET_KEY_BASE") ||
#     raise """
#     environment variable SECRET_KEY_BASE is missing.
#     You can generate one by calling: mix phx.gen.secret
#     """

config :web_server, WebServerWeb.Repo,
  username: "postgres",
  password: "postgres",
  database: "web_prod",
  socket_dir: "/tmp/cloudsql/e-players-293208:asia-northeast1:dummy-db",
  pool_size: 10

config :web_server, WebServerWeb.Endpoint,
  load_from_system_env: true,
  http: [port: {:system, "PORT"}],
  check_origin: false,
  server: true,
  root: ".",
  secret_key_base: "HgTL3ih7BZTz3B1wk+KJw5anKM/OPBLmMtmt5825QYsocP/53Lrzy0Z/IwgQ3pEi"

config :web_server, :db_domain_url, "http://35.185.146.60"

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
#     config :web_server, WebServerWeb.Endpoint, server: true
#
# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.
