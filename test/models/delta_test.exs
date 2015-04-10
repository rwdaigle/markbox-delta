defmodule MarkboxDelta.DeltaTest do
  use ExUnit.Case, async: false
  import Mock
  alias MarkboxDelta.Delta

  test "process user" do
    with_mock HTTPotion, [get: fn(_url, _headers) -> access_token_response end] do
      Delta.process(["1", "5", "9"])
    end
  end

  defp access_token_response do
    %HTTPotion.Response{status_code: 200, body: ~s({"access_token": "abc123"})}
  end
end
