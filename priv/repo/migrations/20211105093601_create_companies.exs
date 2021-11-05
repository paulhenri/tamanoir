defmodule Tamanoir.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string
      add :address_1, :string
      add :address_2, :string
      add :address_3, :string
      add :zip_code, :string
      add :city, :string

      timestamps()
    end
  end
end
