defmodule Cryptex.Encryptor do
  @moduledoc """
  Serves purpose of storing public key and actually fake encrypt data
  """
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def handle_call(data, _from, key) do
    {:reply, encrypt(key, data), key}
  end

  defp encrypt(key, data) when is_binary(key) and is_binary(data) do
    Process.sleep(2000)
    data
  end
end
