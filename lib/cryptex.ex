defmodule Cryptex do
  @moduledoc """
  Fake encrypts data using stored key
  """
  use Application
  alias Cryptex.Key

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Cryptex.Encryptor, [key]),
    ]

    opts = [strategy: :one_for_one, name: Cryptex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp key do
    case Key.read do
      {:ok, key} ->
        key
      {:error, message} ->
        raise message
    end
  end

  @doc """
  Calls fake encryption function

  ##Example
      iex> Cryptex.encrypt "data"
      "data"
  """
  def encrypt(data) do
    GenServer.call Cryptex.Encryptor, data
  end
end
