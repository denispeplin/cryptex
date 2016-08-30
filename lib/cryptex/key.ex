defmodule Cryptex.Key do
  @moduledoc """
  Gets public key from a file
  """

  @doc """
  Reads public key and returns a string with this key

  ## Example
      iex> {:ok, key} = Cryptex.Key.read
      ...> String.starts_with? key, "ssh-rsa"
      true
      ...> String.length key
      392
  """
  def read do
    case File.read(fullpath) do
      {:ok, key} ->
        {:ok, key}
      {:error, _} ->
        {:error, "Can't get key #{fullpath}."}
    end
  end

  defp fullpath do
    Path.join([System.cwd, "keys", "rsa_key.pub"])
  end
end
