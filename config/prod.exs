use Mix.Config

secret_key_base = System.fetch_env!("SECRET_KEY_BASE")
cool_text = System.fetch_env!("COOL_TEXT")
application_port = System.fetch_env!("APP_PORT")
pool_size = System.fetch_env!("POOL_SIZE")
username = System.fetch_env!("DBUSER")
password = System.fetch_env!("DBPWRD")
database = System.fetch_env!("DBNAME")
hostname = System.fetch_env!("DBHOST")
urlhost = System.fetch_env!("URLHOST")

# For production, don't forget to configure the url host
# to something meaningful, Phoenix uses this information
# when generating URLs.
#
# Note we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the `mix phx.digest` task,
# which you should run after static files are built and
# before starting your production server.
config :fish, Fish.Repo,
  # ssl: true,
  migration_primary_key: [name: :id, type: :binary_id],
  show_sensitive_data_on_connection_error: true,
  username: username,
  password: password,
  database: database,
  hostname: hostname,
  # url: database_url,
  pool_size: String.to_integer(pool_size || "10")

config :ticket, TicketWeb.Endpoint,
  http: [
    port: String.to_integer(System.get_env("APP_PORT") || "4000"),
    transport_options: [socket_opts: [:inet6]]
  ],
  url: [host: urlhost, port: application_port],
  secret_key_base: secret_key_base,
  server: true,
  # load_from_system_env: true,
  # # url: [host: {:system, "HOST"}, port: {:system}, "PORT"],
  # url: [host: "localhost", port: 4000],
  # http: [:inet6, port: String.to_integer(application_port)],
  # root: ".",
  cache_static_manifest: "priv/static/cache_manifest.json"

# Do not print debug messages in production
config :logger, level: :info

# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section and set your `:url` port to 443:
#
#     config :ticket, TicketWeb.Endpoint,
#       ...
#       url: [host: "example.com", port: 443],
#       https: [
#         port: 443,
#         cipher_suite: :strong,
#         keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#         certfile: System.get_env("SOME_APP_SSL_CERT_PATH"),
#         transport_options: [socket_opts: [:inet6]]
#       ]
#
# The `cipher_suite` is set to `:strong` to support only the
# latest and more secure SSL ciphers. This means old browsers
# and clients may not be supported. You can set it to
# `:compatible` for wider support.
#
# `:keyfile` and `:certfile` expect an absolute path to the key
# and cert in disk or a relative path inside priv, for example
# "priv/ssl/server.key". For all supported SSL configuration
# options, see https://hexdocs.pm/plug/Plug.SSL.html#configure/1
#
# We also recommend setting `force_ssl` in your endpoint, ensuring
# no data is ever sent via http, always redirecting to https:
#
#     config :ticket, TicketWeb.Endpoint,
#       force_ssl: [hsts: true]
#
# Check `Plug.SSL` for all available options in `force_ssl`.

# Finally import the config/prod.secret.exs which loads secrets
# and configuration from environment variables.
# import_config "prod.secret.exs"
