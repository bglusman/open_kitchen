# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :open_kitchen,
  ecto_repos: [OpenKitchen.Repo]

# Configures the endpoint
config :open_kitchen, OpenKitchen.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vACWhqE9tiIcKqeWDI/lDwboRDJbj6CxMNsmbZh82dR1dul0ZRjpJ38ng/UVhpoz",
  render_errors: [view: OpenKitchen.ErrorView, accepts: ~w(html json)],
  pubsub: [name: OpenKitchen.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "MyApp",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: true, # optional
  secret_key: System.get_env("GUARDIAN_SECRET_KEY"),
  serializer: MyApp.GuardianSerializer

config :ex_admin,
  repo: OpenKitchen.Repo,
  module: OpenKitchen,
  modules: [
    OpenKitchen.ExAdmin.Dashboard,
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :xain, :after_callback, {Phoenix.HTML, :raw}

