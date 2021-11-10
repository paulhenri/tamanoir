defmodule TamanoirWeb.Ticket.TicketController do
  use TamanoirWeb, :controller

  require Logger

  alias Tamanoir.Support
  alias Tamanoir.Ticket.Ticket
  alias Tamanoir.Accounts
  alias Tamanoir.Accounts.User

  def index(conn, _opts) do
    tickets = Support.list_ticket_by_user(conn.assigns[:current_user])
    render(conn, "index.html", tickets: tickets)
  end

  def new(conn, _opts) do
    changeset   = Ticket.changeset_create(%Ticket{}, %{})
    categories  = Support.get_all_categories(false)
    companies   = Accounts.get_user_with_companies!(conn.assigns[:current_user])
    render(conn, "new.html", [changeset: changeset, categories: categories, companies: companies.company] )

  end

  def create(conn, %{"ticket" => ticket_param}) do

    case Support.create_ticket(conn.assigns[:current_user],ticket_param) do
        {ok, %Ticket{} = ticket } -> redirect(conn, to: Routes.ticket_path(conn, :index))
        {error, %Ecto.Changeset{} = changeset } ->
          categories  = Support.get_all_categories(false)
          companies   = Accounts.get_user_with_companies!(conn.assigns[:current_user])
          Logger.debug("#{inspect(changeset)}", [] )
          render(conn, "new.html", [changeset: changeset, categories: categories, companies: companies.company] )

    end

  end

end
