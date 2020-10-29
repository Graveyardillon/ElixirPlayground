defmodule DbServerWeb.DummyView do
  use DbServerWeb, :view
  alias DbServerWeb.DummyView

  def render("index.json", %{dummies: dummies}) do
    %{data: render_many(dummies, DummyView, "dummy.json")}
  end

  def render("show.json", %{dummy: dummy}) do
    %{data: render_one(dummy, DummyView, "dummy.json")}
  end

  def render("dummy.json", %{dummy: dummy}) do
    IO.inspect(dummy)
    %{
      id: dummy.id,
      data: dummy.data
    }
  end
end