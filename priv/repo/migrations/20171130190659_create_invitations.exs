defmodule Divvy.Repo.Migrations.CreateInvitations do
  use Ecto.Migration

  def change do
    create table(:invitations) do
      add :email, :string
      add :accepted, :boolean
      add :user_id, references(:users, on_delete: :nothing)
      add :event_id, references(:events, on_delete: :nothing)

      timestamps()
    end

    create index(:invitations, [:email])
    create unique_index(:invitations, [:user_id, :event_id], name: :invitations_user_event_unique_index)
  end
end
