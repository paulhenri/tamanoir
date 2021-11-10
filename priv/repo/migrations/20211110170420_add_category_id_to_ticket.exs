defmodule Tamanoir.Repo.Migrations.AddCategoryIdToTicket do
  use Ecto.Migration

  def change do
    alter table(:tickets) do
      add :category_id, references(:categories)
    end

  end
end
