defmodule TamanoirWeb.UserRegistrationController do
  use TamanoirWeb, :controller

  alias Tamanoir.Accounts
  alias Tamanoir.Accounts.User
  alias TamanoirWeb.UserAuth

  def new(conn, _params) do
    changeset = Accounts.change_user_registration(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        # For now no mail is being issued, this is for an other time
        # Accounts.deliver_user_confirmation_instructions(
        #  user,
        #  &Routes.user_confirmation_url(conn, :edit, &1)
        # )
        {:ok, _} =
          conn
          |> put_flash(:info, "User created successfully.")
          |> UserAuth.log_in_user(user)

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
