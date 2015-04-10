defmodule MarkboxDelta.Auth do

  alias HTTPotion.Response
  alias Poison.Parser, as: JSON

  def access_token(user) do
    url("api/v1/users/" <> user <> "/access_token.json")
    |> HTTPotion.get([basic_auth: basic_auth])
    |> parse_response_body
    |> get_access_token
  end

  defp url(path), do: System.get_env("MARKBOX_AUTH_HOST") <> path

  defp process_request_headers(headers) do
    Dict.put headers, :"User-Agent", "markbox-delta"
    Dict.put headers, :"Content-Type", "application/json"
  end

  defp parse_response_body(%Response{status_code: 200, body: body}), do: JSON.parse(body)
  defp parse_response_body(%Response{status_code: _,}), do: {:error, nil}

  defp get_access_token({:ok, %{"access_token" => token}}), do: token
  defp get_access_token(_), do: nil

  defp basic_auth do
    {
      System.get_env("MARKBOX_AUTH_API_USER"),
      System.get_env("MARKBOX_AUTH_API_PASSWORD")
    }
  end

end
