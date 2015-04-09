defmodule MarkboxDelta.DropboxController do
  use MarkboxDelta.Web, :controller

  plug :action

  def webhook(conn, %{"challenge" => challenge}) do
    text conn, challenge
  end

  def webhook(conn, %{"delta" => %{"users" => users}}) do
    json conn, %{users: users}
  end

  def webhook(conn, _params) do
    conn
    |> put_status(404)
    |> text "Unrecognized request"
  end
end
