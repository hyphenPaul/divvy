defmodule DivvyWeb.GiftController do
  use DivvyWeb, :controller

  alias Divvy.Events
  alias Divvy.Events.Gift

  def action(conn, _) do
    apply(__MODULE__, action_name(conn), [conn, conn.params, conn.assigns.current_user])
  end

  def new(conn, %{"event_id" => event_id}, user) do
    changeset = Events.change_gift(%Gift{event_id: event_id})
    render conn, "new.html", changeset: changeset, event_id: event_id
  end

  def create(conn, %{ "gift" => gift_params }, user) do
    case Events.create_gift(gift_params, user) do
      {:ok, gift} ->
        conn
        |> put_flash(:info, "Your gift #{gift.name} was created")
        |> redirect(to: event_path(conn, :show, gift.event_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, event_id: gift_params[:event_id])
    end
  end

  def delete(conn, %{"id" => id}, _user) do
    gift = Events.get_gift!(id)
    {:ok, _gift} = Events.delete_gift(gift)

    conn
    |> put_flash(:info, "Gift deleted successfully.")
    |> redirect(to: event_path(conn, :show, gift.event_id))
  end
end
