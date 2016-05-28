use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :sample_api, SampleApi.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :sample_api, SampleApi.Repo,
  adapter: Sqlite.Ecto,
  database: "db/sample_api_test.sqlite",
  pool: Ecto.Adapters.SQL.Sandbox
