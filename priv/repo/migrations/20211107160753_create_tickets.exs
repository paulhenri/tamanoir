defmodule Tamanoir.Repo.Migrations.CreateTickets do
  use Ecto.Migration

  def change do
    create table(:tickets) do
      add :status, :integer
      add :question, :string
      add :closing_date, :naive_datetime
      add :closing_reason, :string
      add :solution, :string

      add :creuser_id, references(:users)
      add :takenby_user_id, references(:users)
      add :closing_user_id, references(:users)
      add :company_id, references(:companies)

      timestamps()
    end
  end
end
