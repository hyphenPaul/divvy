defmodule Divvy.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :date, :naive_datetime
      add :description, :text
      add :owner_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:events, [:user_id])
  end
end
