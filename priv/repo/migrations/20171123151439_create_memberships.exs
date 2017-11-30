defmodule Divvy.Repo.Migrations.CreateMemberships do
  use Ecto.Migration

  def change do
    create table("memberships") do
      add :event_id, references(:events, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)
    end
  end
end
