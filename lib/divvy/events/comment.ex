defmodule Divvy.Events.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Divvy.Events.Comment


  schema "comments" do
    field :comment, :string
    field :public, :boolean, default: false
    belongs_to :gift, Divvy.Events.Gift
    belongs_to :user, Divvy.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [:comment, :gift_id, :public])
    |> validate_required([:comment])
    |> assoc_constraint(:gift)
    |> assoc_constraint(:user)
  end
end
