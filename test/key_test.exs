defmodule Cryptex.KeyTest do
  use ExUnit.Case
  doctest Cryptex.Key
  import Mock

  test "read existing key" do
    {:ok, key} = Cryptex.Key.read
    assert key =~ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQ"
  end

  test "read missing key" do
    with_mock File, [read: fn(_) -> {:error, :enoent} end] do
      {:error, message} = Cryptex.Key.read
      assert message =~ "Can't get key"
      assert message =~ "rsa_key.pub"
    end
  end
end
