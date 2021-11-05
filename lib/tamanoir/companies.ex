defmodule Tamanoir.Companies do
  @moduledoc """
    Company context - used to handle companies (CRUD)
  """

  import Ecto.Query, warn: false
  alias Tamanoir.Repo

  alias Tamanoir.Company.Company

  def list_company() do
    Repo.all(Company)
  end

  def register_company(attrs) do
    %Company{}
      |> Company.changeset_create(attrs)
      |> Repo.insert()
  end

  def get_company_by_id(id) do
    Repo.get!(Company, id )
  end

  def change_company_edit(company, attrs \\ %{}) do
    Company.changeset_update(company, attrs)
  end

  def update_company(company, attrs) do
    company
      |> Company.changeset_update(attrs)
      |> Repo.update()
  end

end
