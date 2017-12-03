defmodule DivvyWeb.InvitationController do
  use DivvyWeb, :controller

  alias Divvy.Events
  alias Divvy.Events.Invitation

  def action(conn, _) do
    apply(__MODULE__, action_name(conn), [conn, conn.params, conn.assigns.current_user])
  end

  def create(conn, %{"invitation" => invitation_params}, user) do
    case Events.create_invitation(invitation_params, user) do
      {:ok, invitation} ->
        # TODO: Send email background worker

        conn
        |> put_flash(:info, "An invitation was sent to #{invitation.email}.")
        |> redirect(to: event_path(conn, :show, invitation.event_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:info, "#{inspect(changeset.errors)}") #TODO: Render this nicely with translate_errors
        |> redirect(to: event_path(conn, :show, invitation_params["event_id"]))
    end
  end
end
