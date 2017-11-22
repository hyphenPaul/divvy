defmodule Divvy.Events.Gift do
  use Ecto.Schema
  import Ecto.Changeset
  alias Divvy.Events.Gift


  schema "gifts" do
    field :name, :string
    field :description, :string

    belongs_to :user, Divvy.Accounts.User
    belongs_to :event, Divvy.Events.Event

    timestamps()
  end

  @doc false
  def changeset(%Gift{} = gift, attrs) do
    gift
    |> cast(attrs, [:name, :description, :event_id])
    |> validate_required([:name, :description])
    |> assoc_constraint(:user)
    |> assoc_constraint(:event)
  end
end
