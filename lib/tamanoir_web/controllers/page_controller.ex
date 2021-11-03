defmodule TamanoirWeb.PageController do
  use TamanoirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
