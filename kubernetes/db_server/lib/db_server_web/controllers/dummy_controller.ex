defmodule DbServerWeb.DummyController do
  use DbServerWeb, :controller

  alias DbServer.Dummies

  def list(conn, _params) do
    dummies = Dummies.list_dummy()

    render(conn, "index.json", dummies: dummies)
  end

  def new(conn, params) do
    {:ok, dummy} = Dummies.create_dummy(params)

    render(conn, "show.json", dummy: dummy)
  end

  def get(conn, params) do
    dummy = Dummies.get_dummy!(params["id"])

    render(conn, "show.json", dummy: dummy)
  end
end