defmodule Divvy.Events.Invitation do
  use Ecto.Schema
  import Ecto.Changeset
  alias Divvy.Events.Invitation

  schema "invitations" do
    field :email, :string
    field :user_id, :string
    belongs_to :event, Divvy.Events.Event

    timestamps()
  end

  @doc false
  def changeset(%Invitation{} = gift, attrs) do
    gift
    |> cast(attrs, [:email, :user_id, :event_id])
    |> validate_required([:email])
    |> assoc_constraint(:event)
  end
end
