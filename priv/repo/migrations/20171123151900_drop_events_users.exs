defmodule Divvy.Repo.Migrations.DropEventsUsers do
  use Ecto.Migration

  def change do
    drop table(:events_users)
  end
end
