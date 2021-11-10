defmodule TamanoirWeb.DashboardController do
  use TamanoirWeb, :controller

  def index(conn, _opts) do
    conn
      |> render("index.html")
  end

end
