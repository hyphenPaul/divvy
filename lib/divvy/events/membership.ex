defmodule Divvy.Events.Membership do
  use Ecto.Schema
  import Ecto.Changeset
  alias Divvy.Events.Membership

  schema "memberships" do
    belongs_to :user, Divvy.Accounts.User
    belongs_to :event, Divvy.Events.Event

    timestamps()
  end

  @doc false
  def changeset(%Membership{} = membership, attrs) do
    membership
    |> cast(attrs, [:user_id, :event_id])
    |> assoc_constraint(:user) 
    |> assoc_constraint(:event) 
  end
end
