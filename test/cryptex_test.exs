defmodule CryptexTest do
  use ExUnit.Case
  doctest Cryptex
  import Mock

  test "encryptor call" do
    # pretend encryptor returns something other than input
    with_mock Cryptex.Encryptor, [handle_call: fn(_, _, _) -> {:reply, "data output", "key"} end] do
      assert Cryptex.encrypt("data") == "data output"
    end
  end
end
