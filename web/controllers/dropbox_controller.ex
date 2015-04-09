defmodule MarkboxDelta.DropboxController do
  use MarkboxDelta.Web, :controller
  require Logger
  alias MarkboxDelta.Delta

  plug :action

  # def webhook do
  #   conn, %{"challenge" => challenge}) -> text conn, challenge
  #   conn, %{"delta" => %{"users" => users}} -> text conn, "OK"
  #   conn, _params -> conn |> put_status(404) |> text "ERROR"
  # end

  def webhook(conn, %{"challenge" => challenge}) do
    text conn, challenge
  end

  def webhook(conn, %{"delta" => %{"users" => users}}) do
    process_users(users)
    text conn, "OK"
  end

  def webhook(conn, _params) do
    conn
    |> put_status(404)
    |> text "ERROR"
  end

  defp process_users([user_id | tail]) do
    Task.start(Delta, :process, [user_id])
    process_users(tail)
  end

  defp process_users([]) do
  end
end
