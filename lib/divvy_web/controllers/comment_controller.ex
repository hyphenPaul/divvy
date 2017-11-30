defmodule DivvyWeb.CommentController do
  use DivvyWeb, :controller
  alias Divvy.Events

  def action(conn, _) do
    apply(__MODULE__, action_name(conn), [conn, conn.params, conn.assigns.current_user])
  end

  def create(conn, %{"comment" => comment_params}, user) do
    gift = Events.get_gift!(comment_params["gift_id"])

    case Events.create_comment(comment_params, user) do
      {:ok, comment} ->
        conn
        |> put_flash(:info, "Your comment was added")
        |> redirect(to: event_path(conn, :show, gift.event_id))
      {:error, conn} ->
        conn
        |> put_flash(:error, "There was an error adding your comment")
        |> redirect(to: event_path(conn, :show, gift.event_id))
    end
  end

  def delete(conn, %{"id" => id, "event_id" => event_id}, _user) do
    comment = Events.get_comment!(id)
    {:ok, _comment} = Events.delete_comment(comment)

    conn
    |> put_flash(:info, "comment deleted successfully.")
    |> redirect(to: event_path(conn, :show, event_id))
  end
end
