defmodule MarkboxDelta.Endpoint do
  use Phoenix.Endpoint, otp_app: :markbox_delta

  # Serve at "/" the given assets from "priv/static" directory
  plug Plug.Static,
    at: "/", from: :markbox_delta,
    only: ~w(css images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_markbox_delta_key",
    signing_salt: "4zQHD7St",
    encryption_salt: "P5Cd4aAK"

  plug :router, MarkboxDelta.Router
end
