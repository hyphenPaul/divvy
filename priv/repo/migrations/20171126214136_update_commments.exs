defmodule Divvy.Repo.Migrations.UpdateCommments do
  use Ecto.Migration

  def change do
    execute "ALTER TABLE comments DROP CONSTRAINT comments_gift_id_fkey"
    execute "ALTER TABLE comments DROP CONSTRAINT comments_user_id_fkey"

    alter table(:comments) do
      modify :gift_id, references(:gifts, on_delete: :delete_all)
      modify :user_id, references(:users, on_delete: :delete_all)
    end
  end
end
