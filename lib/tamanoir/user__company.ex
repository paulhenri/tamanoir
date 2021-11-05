defmodule Tamanoir.User_Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users_companies" do

    belongs_to :user, Tamanoir.Accounts.User
    belongs_to :company, Tamanoir.Company.Company
  end

  @doc false
  def changeset(user__company, attrs) do
    user__company
    |> cast(attrs, [:user_id, :company_id])
    |> validate_required([:user_id, :company_id])
  end
end
