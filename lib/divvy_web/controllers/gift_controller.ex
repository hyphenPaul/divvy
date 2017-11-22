defmodule DivvyWeb.GiftController do
  use DivvyWeb, :controller

  def new(conn, %{"event_id" => event_id}) do
    assign(conn, :event_id, event_id)    
    render conn, "new.html"
  end
end
