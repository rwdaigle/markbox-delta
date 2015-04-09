use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :markbox_delta, MarkboxDelta.Endpoint,
  secret_key_base: "rCSh9G9vo5Z5+XM0rHF9h996821qOtQ5ivsiyqD1ByhckYXQIxozlmBK3yZ35wa3"

# Configure your database
config :markbox_delta, MarkboxDelta.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "markbox_delta_prod"
