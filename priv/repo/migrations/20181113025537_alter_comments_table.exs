defmodule Divvy.Repo.Migrations.AlterCommentsTable do
  use Ecto.Migration

  def change do
    alter table(:comments) do
      add :public, :boolean, default: false, null: false
    end
  end
end
