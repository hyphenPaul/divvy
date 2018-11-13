defmodule Divvy.Events.Invitation do
  use Ecto.Schema
  import Ecto.Changeset
  alias Divvy.Events.Invitation


  schema "invitations" do
    field :email, :string
    field :accepted, :boolean
    belongs_to :creator, Divvy.Accounts.User, foreign_key: :user_id
    belongs_to :event, Divvy.Events.Event

    timestamps()
  end

  @doc false
  def changeset(%Invitation{} = invitation, attrs) do
    invitation
    |> cast(attrs, [:email, :event_id, :accepted])
    |> validate_required([:email, :event_id])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email, name: :invitations_user_event_unique_index)
    |> assoc_constraint(:creator)
    |> assoc_constraint(:event)
  end
end
