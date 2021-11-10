defmodule Tamanoir.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :inactive, :boolean, default: false, null: false
      timestamps()
    end
  end
end
