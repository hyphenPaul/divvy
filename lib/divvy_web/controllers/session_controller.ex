defmodule DivvyWeb.SessionController do
  use DivvyWeb, :controller

  def new(conn, _params) do
    if conn.assigns[:current_user] do
      redirect(conn, to: user_path(conn, :show, conn.assigns.current_user))
    else
      render(conn, "new.html")
    end
  end

  def create(conn, %{"session" => %{ "email" => email, "password" => password}}) do
    case DivvyWeb.Auth.login_with_credentials(conn, email, password) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back #{conn.assigns.current_user.name}")
        |> redirect(to: user_path(conn, :show, conn.assigns.current_user))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Could not login with those credentials")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> DivvyWeb.Auth.logout()
    |> redirect(to: page_path(conn, :index))
  end
end
