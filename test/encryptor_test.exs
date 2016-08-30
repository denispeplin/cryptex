defmodule Cryptex.EncryptorTest do
  use ExUnit.Case, async: true

  test "fake encrypts data" do
    assert GenServer.call(Cryptex.Encryptor, "data") == "data"
  end
end
