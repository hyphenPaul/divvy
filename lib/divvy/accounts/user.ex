defmodule Divvy.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Comeonin.Bcrypt, only: [hashpwsalt: 1]
  alias Divvy.Accounts.User

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_many :owned_events, Divvy.Events.Event, foreign_key: :owner_id
    many_to_many :events, Divvy.Events.Event, join_through: "events_users"

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
    |> unique_constraint(:email)
  end

  def registration_changeset(%User{} = user, attrs) do
    changeset(user, attrs)
    |> cast(attrs, [:password])
    |> validate_length(:password, min: 6, max: 50)
    |> generate_password_hash()
    |> validate_required([:password_hash])
  end

  defp generate_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} -> 
        put_change(changeset, :password_hash, hashpwsalt(password))
      _ ->
        changeset
    end
  end
end
