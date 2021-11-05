defmodule TamanoirWeb.UserAdministrationController do

  @moduledoc """
    Module dedicated to the administration of the users. The module should only be
    used by users with admin_status, that is users that should resolve tickets in
    the broader system.
  """

  use TamanoirWeb, :controller


  alias Tamanoir.Accounts

  def index(conn, _params) do
    lt_users = Accounts.list_user()
    render(conn, "index.html", users: lt_users)
  end

  def edit(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "edit.html", user: user)
  end

end
