defmodule Tamanoir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Tamanoir.Repo,
      # Start the Telemetry supervisor
      TamanoirWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Tamanoir.PubSub},
      # Start the Endpoint (http/https)
      TamanoirWeb.Endpoint
      # Start a worker by calling: Tamanoir.Worker.start_link(arg)
      # {Tamanoir.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Tamanoir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TamanoirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
