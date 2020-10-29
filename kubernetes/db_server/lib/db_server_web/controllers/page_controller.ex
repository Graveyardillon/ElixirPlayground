defmodule DbServerWeb.PageController do
  use DbServerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
