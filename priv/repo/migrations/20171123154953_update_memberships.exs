defmodule Divvy.Repo.Migrations.UpdateMemberships do
  use Ecto.Migration

  def change do
    alter table("memberships") do
      timestamps()
    end
  end
end
