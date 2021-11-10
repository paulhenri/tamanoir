defmodule Tamanoir.Ticket.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :inactive, :boolean, default: false
    field :name, :string

    has_many :tickets, Tamanoir.Ticket.Ticket, foreign_key: :cat_id

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :inactive])
    |> validate_required([:name, :inactive])
  end
end
