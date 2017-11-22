defmodule Divvy.Repo.Migrations.CreateEventsUsers do
  use Ecto.Migration

  def change do
    create table(:events_users, primary_key: false) do
      add :event_id, references(:events, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:events_users, [:event_id])
    create index(:events_users, [:user_id])
  end
end
