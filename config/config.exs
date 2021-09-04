# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :double_update,
  ecto_repos: [DoubleUpdate.Repo]

# Configures the endpoint
config :double_update, DoubleUpdateWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8V7eOr6P3ILb6oul6NKYzm2AW8opnL/6rwdG2hPuDt0HZOhqpGSPMO6/jWXPqo79",
  render_errors: [view: DoubleUpdateWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DoubleUpdate.PubSub,
  live_view: [signing_salt: "XHeBry3J"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
