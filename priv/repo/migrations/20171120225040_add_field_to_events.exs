defmodule Divvy.Repo.Migrations.AddFieldToEvents do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :owner_id, references(:users, on_delete: :nothing)
    end

    create index(:events, [:owner_id])
  end
end
