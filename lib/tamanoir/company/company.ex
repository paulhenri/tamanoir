defmodule Tamanoir.Company.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies" do
    field :address_1, :string
    field :address_2, :string
    field :address_3, :string
    field :city, :string
    field :name, :string
    field :zip_code, :string

    many_to_many :users, Tamanoir.Accounts.User, join_through: Tamanoir.User_Company

    timestamps()
  end

  @doc false
  def changeset_create(company, attrs \\ %{}) do
    company
    |> cast(attrs, [:name, :address_1, :address_2, :address_3, :zip_code, :city])
    |> validate_required([:name, :address_1, :zip_code, :city])
  end

  def changeset_update(company, attrs \\ %{}) do
    company
    |> cast(attrs, [:name, :address_1, :address_2, :address_3, :zip_code, :city])
    |> validate_required([:name, :address_1, :zip_code, :city])
  end

end
