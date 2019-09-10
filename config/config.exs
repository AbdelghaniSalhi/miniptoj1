# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :projetGotham,
  ecto_repos: [ProjetGotham.Repo]

# Configures the endpoint
config :projetGotham, ProjetGothamWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "aT0h6VuRzEX7TbS8M6PYtfBy0hzVYgYkSko5p2ye9jtlvWFPI5alzTAhNZ0jU2Vw",
  render_errors: [view: ProjetGothamWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ProjetGotham.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
