defmodule WebServerWeb.SendController do
  use WebServerWeb, :controller

  @base_url Application.get_env(:web_server, :db_domain_url) <> "/api"
  @content_type [{"Content-Type", "application/json"}]

  def list(conn, _params) do
    url = @base_url <> "/index"

    {:ok, response} = HTTPoison.get(url, @content_type)
    {:ok, body} = Poison.decode(response.body)

    json(conn, body)
  end
end