# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tamanoir,
  ecto_repos: [Tamanoir.Repo]

# Configures the endpoint
config :tamanoir, TamanoirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lpVAc//QU2WpOYh2WfX9HAuYoPp2WqSJDoTukUhiQGSy3qamaoEK/qjDm7XYnWZG",
  render_errors: [view: TamanoirWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Tamanoir.PubSub,
  live_view: [signing_salt: "9OBy2/sN"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :esbuild,
  version: "0.12.18",
  default: [
    args: ~w(js/app.js --bundle --target=es2018 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tamanoir, Tamanoir.Mailer, adapter: Swoosh.Adapters.Local

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
