defmodule MarkboxDelta.Delta do
  use MarkboxDelta.Web, :model

  require Logger

  def process(user_id) do
    Logger.info "event=db.delta user=#{user_id}"
  end
end
