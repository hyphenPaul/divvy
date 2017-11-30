defmodule Divvy.Repo.Migrations.CreateInvitationsTable do
  use Ecto.Migration

  def change do
    create table(:invitations) do
      add :email, :string
      add :user_id, :string
      add :sent, :boolean
      add :accepted, :boolean
      add :event_id, references(:events, on_delete: :nothing)

      timestamps()
    end
  end
end
