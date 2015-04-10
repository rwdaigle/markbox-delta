defmodule MarkboxDelta.AuthTest do
  use ExUnit.Case, async: false
  import Mock
  alias MarkboxDelta.Auth

  test "access token" do
    body = ~s({"access_token": "abc123"})
    with_mock HTTPotion, [get: fn(_url, _headers) -> %HTTPotion.Response{status_code: 200, body: body} end] do
      assert Auth.access_token("1") == "abc123"
      assert called HTTPotion.get(url, [basic_auth: basic_auth])
    end
  end

  test "access token failure" do
    body = ~s(Nasty stack trace)
    with_mock HTTPotion, [get: fn(_url, _headers) -> %HTTPotion.Response{status_code: 500, body: body} end] do
      assert Auth.access_token("1") == nil
      assert called HTTPotion.get(url, [basic_auth: basic_auth])
    end
  end

  defp url, do: System.get_env("MARKBOX_AUTH_HOST") <> "api/v1/users/1/access_token.json"
  defp basic_auth, do: {System.get_env("MARKBOX_AUTH_API_USER"), System.get_env("MARKBOX_AUTH_API_PASSWORD")}
end
