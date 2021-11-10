defmodule Tamanoir.Repo.Migrations.AlterQuestionAndSolutionForTicket do
  use Ecto.Migration

  def change do
      alter table(:tickets) do
        modify :question, :text
        modify :solution, :text
      end
  end
end
