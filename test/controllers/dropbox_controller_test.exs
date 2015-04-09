defmodule MarkboxDelta.DropboxControllerTest do
  use MarkboxDelta.ConnCase
  use ExUnit.Case, async: true

  test "GET /dropbox/webhook" do
    conn = get conn(), "/dropbox/webhook", %{"challenge" => "DBCHALLENGE"}
    assert conn.status == 200
    assert conn.resp_body == "DBCHALLENGE"
  end

  test "POST /dropbox/webhook" do
    conn = post conn(), "/dropbox/webhook", %{"delta" => %{"users" => [12, 67]}}
    assert conn.status == 200
    assert conn.resp_body == "OK"
  end

  test "POST /dropbox/webhook with unknown body" do
    conn = post conn(), "/dropbox/webhook", %{"foo" => "bar"}
    assert conn.status == 404
    assert conn.resp_body == "ERROR"
  end
end
