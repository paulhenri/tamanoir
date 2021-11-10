defmodule TamanoirWeb.Ticket.TicketView do
  use TamanoirWeb, :view

@doc """
Helper to translate a ticket status (0..4) in text
"""
  def get_ticket_status(ticket_status) when is_integer(ticket_status) do
      case ticket_status do
        0  -> '<span class="px-2 py-1 font-semibold leading-tight text-yellow-700 bg-yellow-100 rounded-full dark:bg-green-700 dark:text-green-100"> Created </span>'
         1 -> '<span class="px-2 py-1 font-semibold leading-tight text-yellow-700 bg-yellow-100 rounded-full dark:bg-green-700 dark:text-green-100"> Created </span>'
        2  -> '<span class="px-2 py-1 font-semibold leading-tight text-blue-700 bg-blue-100 rounded-full dark:bg-green-700 dark:text-green-100"> Pending </span>'
        3  -> '<span class="px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:bg-green-700 dark:text-green-100"> Pending </span>'
      end

  end
@doc """
Helper to translate a ticket status (0..4) in text
"""
  def get_ticket_status(_) do
    '<span class="px-2 py-1 font-semibold leading-tight text-yellow-700 bg-yellow-100 rounded-full dark:bg-green-700 dark:text-green-100"> Created </span>'
  end

end
