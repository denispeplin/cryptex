# Cryptex

Fake encryption of user supplied data (not) using stored public key.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `cryptex` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:cryptex, "~> 0.1.0"}]
    end
    ```

  2. Ensure `cryptex` is started before your application:

    ```elixir
    def application do
      [applications: [:cryptex]]
    end
    ```

## Usage

1. Put a key in `keys` folder. `Cryptext` expects a key to be named `rsa_key.pub`.
2. Call `Cryptex.encrypt(your_data)`. After two seconds of work imitation, `Cryptex` will return your data untouched.
