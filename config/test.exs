use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :divvy, DivvyWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :divvy, Divvy.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "divvy_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Limit the rounds of encryption when hashing to keep tests fast
config :bcrypt_elixir, :log_rounds, 4
