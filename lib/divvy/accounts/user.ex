defmodule Divvy.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Divvy.Accounts.User


  schema "users" do
    field :description, :string
    field :email, :string
    field :name, :string
    has_many :owned_events, Divvy.Events.Event, foreign_key: :owner_id
    many_to_many :events, Divvy.Events.Event, join_through: "events_users"

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email, :description])
    |> validate_required([:name, :email, :description])
    |> unique_constraint(:email)
  end
end
