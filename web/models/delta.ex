defmodule MarkboxDelta.Delta do
  use MarkboxDelta.Web, :model
  require Logger
  alias MarkboxDelta.Delta

  def process(users) when is_list(users) do
    Enum.each(users, &Task.start(Delta, :process, [&1]))
  end

  def process(user) when is_binary(user) do
    Logger.info "event=db.delta user=#{user}"
    # Get latest cursor for user
    MarkboxDelta.Auth.access_token(user)
    # |> MarkboxDelta.Dropbox.delta
    # |> MarkboxDelta.Dropbox.files
    # |> MarkboxDelta.Renderer.render
    # |> MarkboxDelta.Dropbox.save
  end
end
