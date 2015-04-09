use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :markbox_delta, MarkboxDelta.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :markbox_delta, MarkboxDelta.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "markbox_delta_test",
  size: 1,
  max_overflow: false
