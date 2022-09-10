defmodule Motorshopelixirphoenix.Repo.Migrations.CreateAddressesTable do
  use Ecto.Migration

  def up do
    create table(:addresses, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :zip_code, :string, null: false
      add :state, :string, null: false
      add :city, :string, null: false
      add :street, :string, null: false
      add :number, :string, null: false
      add :complement, :string, default: " "

      add :user_id, references(:users, type: :binary_id, column: :uuid, on_delete: :nothing)
      timestamps()
    end

    create unique_index(:addresses, [:zip_code])
  end
  def down do
    drop table(:addresses)
  end
end
