defmodule Tamanoir.Support do
  @moduledoc """
    This module is used as an interface to the tickets - It should contains
    all informations regarding support (Mainly the tickets) and enable operations on
    tickets or tickets-related tables
  """

  import Ecto.Query, warn: false
  alias Tamanoir.Repo

  alias Tamanoir.Ticket.Ticket
  alias Tamanoir.Accounts.User


 #List all tickets created by the user
 def list_ticket_by_user(%User{} = user) do
    query =
         from t in Tamanoir.Ticket.Ticket,
         where: t.creuser_id == ^user.id,
         preload: [:company, :category, :cre_user]
    Repo.all(query)

 end


 def get_all_categories(active) do
    query = from c in Tamanoir.Ticket.Category, where: c.inactive == ^active
    Repo.all(query)
 end


 def create_ticket(%User{} = curr_user, params) do
    %Ticket{}
      |> Ticket.changeset_create(params)
      |> Ecto.Changeset.put_assoc(:cre_user, curr_user)
      |> Repo.insert()
 end


end
