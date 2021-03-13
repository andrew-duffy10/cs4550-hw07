use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :scheduler, Scheduler.Repo,
<<<<<<< HEAD
  username: "andrew2",
  password: "ArtyChad1010",
=======
  username: "username",
  password: "password",
>>>>>>> 0649c7fa7868a3b291fadd7b3a5a439c039686e7
  database: "scheduler_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :scheduler, SchedulerWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
