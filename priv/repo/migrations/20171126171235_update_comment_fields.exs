defmodule Divvy.Repo.Migrations.UpdateCommentFields do
  use Ecto.Migration

  def change do
    alter table(:comments) do
      remove :text
      add :comment, :string
    end
  end
end
