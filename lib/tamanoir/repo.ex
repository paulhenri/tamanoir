defmodule Tamanoir.Repo do
  use Ecto.Repo,
    otp_app: :tamanoir,
    adapter: Ecto.Adapters.Postgres
end
