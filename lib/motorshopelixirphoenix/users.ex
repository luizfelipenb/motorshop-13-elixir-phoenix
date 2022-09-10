defmodule Motorshopelixirphoenix.Users do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}


  @fields [:name, :cpf, :email, :phone, :birth_date, :description,
:password, :is_seller ]

  schema "users" do
    field :name, :string
    field :cpf, :string
    field :email, :string
    field :phone, :string
    field :birth_date, :string
    field :description, :string, default: " "
    field :password, :string
    field :is_seller, :boolean
    field :is_active, :boolean

    has_many :addresses, Motorshopelixirphoenix.Addresses

    timestamps()
  end

  def changeset (params)do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
