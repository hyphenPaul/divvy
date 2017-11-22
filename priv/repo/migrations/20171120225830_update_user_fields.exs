defmodule Divvy.Repo.Migrations.UpdateUserFields do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :password_hash, :string
      remove :description
    end
  end
end
