defmodule DivvyWeb.PageController do
  use DivvyWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
