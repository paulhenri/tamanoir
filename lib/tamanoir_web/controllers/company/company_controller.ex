defmodule TamanoirWeb.Company.CompanyController do
  @moduledoc """
    Company controller, used to create, edit and delete companies from the database
  """

  use TamanoirWeb, :controller

  alias Tamanoir.Companies
  alias Tamanoir.Company.Company
  alias TamanoirWeb.UserAuth

  def index(conn, _opts) do
    companies = Companies.list_company()
    render(conn, "index.html", companies: companies)
  end

  def new(conn, _opts) do
    changeset = Company.changeset_create(%Company{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"company" => company_params}) do
    case Companies.register_company(company_params) do
    {:ok, _} ->
      conn
        |> put_flash("info", "Company registered successfuly !")
        |> redirect(to: Routes.company_path(conn, :index) )
    {:error, %Ecto.Changeset{} = changeset} ->        render(conn, "new.html", changeset: changeset)
    end

  end

  def edit(conn, %{"id" => id}) do
    company = Companies.get_company_by_id(id)
    changeset = Companies.change_company_edit(company)
    render(conn, "edit.html", %{changeset: changeset, company: company} )
  end

  def update(conn, %{"id" => id, "company" => company_params}) do
    company = Companies.get_company_by_id(id)
    case Companies.update_company(company, company_params) do
      {:ok, _} ->
        conn
          |> put_flash("info", "Company updated successfuly !")
          |> redirect(to: Routes.company_path(conn, :index) )
      {:error, %Ecto.Changeset{} = changeset} ->        render(conn, "edit.html", %{changeset: changeset, company: company})
    end
  end

end
