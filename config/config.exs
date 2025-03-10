# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_blog,
  ecto_repos: [PhoenixBlog.Repo]

# Configures the endpoint
config :phoenix_blog, PhoenixBlogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ngcLvnoYg7nRPSHaBlCuT5iWImf5larh7kgzuhM7WQCVteosIIyNu1vxzBJurToA",
  render_errors: [view: PhoenixBlogWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: PhoenixBlog.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "k9D6vPzv"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
