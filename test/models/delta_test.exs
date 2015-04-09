defmodule MarkboxDelta.DeltaTest do
  use ExUnit.Case, async: true
  alias MarkboxDelta.Delta

  test "process user" do
    Delta.process(1)
  end
end
