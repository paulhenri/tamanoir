defmodule Tamanoir.Ticket.Ticket do
  use Ecto.Schema
  import Ecto.Changeset


  alias Tamanoir.Accounts.User

  schema "tickets" do
      field :status, :integer
      field :question, :string
      field :closing_date, :naive_datetime
      field :closing_reason, :string
      field :solution, :string

      belongs_to :cre_user, Tamanoir.Accounts.User, foreign_key: :creuser_id
      belongs_to :closing_user, Tamanoir.Accounts.User, foreign_key: :closing_user_id
      belongs_to :tech_user, Tamanoir.Account.User, foreign_key: :takenby_user_id
      belongs_to :company, Tamanoir.Company.Company, foreign_key: :company_id

      belongs_to :category, Tamanoir.Ticket.Category, foreign_key: :category_id

    timestamps()
  end

  @doc false
  def changeset_create(ticket, attrs,  _opts \\ []) do
    ticket
    |> cast(attrs, [:question, :company_id, :category_id])
    |> validate_required([:question, :company_id, :category_id])
    |> cast_assoc(:category)
    |> cast_assoc(:company)
  end
end
