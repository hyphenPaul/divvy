# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :divvy,
  ecto_repos: [Divvy.Repo]

# Configures the endpoint
config :divvy, DivvyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PhxpmiwVL42vcb1JrJmJ9XT/CY/qmjjS2l2wPEp7USwdlZAQ5/v7c4BzTgnKAClT",
  render_errors: [view: DivvyWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Divvy.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
