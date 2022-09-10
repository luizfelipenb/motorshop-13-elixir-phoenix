defmodule Motorshopelixirphoenix.Addresses do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreing_key_type :binary_id
  @derive {Phoenix.Param, key: :uuid}


  @fields [:zip_code, :state, :city, :street, :number, :complement]

  schema "addresses" do
    field :zip_code, :string
    field :state, :string
    field :city, :string
    field :street, :string
    field :number, :string
    field :complement, :string, default: " "

    belongs_to :user_id, Motorshopelixirphoenix.Users, references: :uuid, type: :binary_id

    timestamps()
  end

  create index(:addresses, [:user_id])

  def changeset (params)do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
