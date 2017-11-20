defmodule Divvy.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :description, :text
      add :event_id, references(:events, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:users, [:email])
    create index(:users, [:event_id])
  end
end
