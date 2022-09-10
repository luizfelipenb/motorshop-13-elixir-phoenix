defmodule Motorshopelixirphoenix.Repo.Migrations.CreateUsersTable do
    use Ecto.Migration

    def up do
      create table(:users, primary_key: false) do
        add :id, :uuid, primary_key: true, null: false
        add :name, :string, null: false
        add :cpf, :string, null: false
        add :email, :string, null: false
        add :phone, :string, null: false
        add :birth_date, :string, null: false
        add :description, :string, default: " "
        add :password, :string, null: false
        add :is_seller, :boolean, null: false
        add :is_active, :boolean, default: true

        timestamps()

      end

      create unique_index(:users, [:email])
      create unique_index(:users, [:cpf])
    end

    def down do
      drop table(:users)
    end
  end
