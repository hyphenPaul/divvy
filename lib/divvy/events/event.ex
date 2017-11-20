defmodule Divvy.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias Divvy.Events.Event


  schema "events" do
    field :date, :naive_datetime
    field :description, :string
    field :name, :string
    belongs_to :owner, Divvy.Accounts.User, foreign_key: :owner_id
    many_to_many :users, Divvy.Accounts.User, join_through: "events_users"

    timestamps()
  end

  @doc false
  def changeset(%Event{} = event, attrs) do
    event
    |> cast(attrs, [:name, :date, :description, :user_id])
    |> validate_required([:name, :date, :description])
    |> assoc_constraint(:owner)
  end
end
