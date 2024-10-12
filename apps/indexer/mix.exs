defmodule Indexer.MixProject do
  use Mix.Project

  def project do
    [
      aliases: aliases(),
      app: :indexer,
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps: deps(),
      deps_path: "../../deps",
      description: "Fetches block chain data from on-chain node for later reading with Explorer.",
      elixir: "~> 1.13",
      elixirc_options: [
        warnings_as_errors: true
      ],
      elixirc_paths: elixirc_paths(Mix.env()),
      lockfile: "../../mix.lock",
      start_permanent: Mix.env() == :prod,
      version: "4.1.8"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [
        :logger,
        :jason,
        :logger_json,
        :cowboy,
        :plug
      ],
      mod: {Indexer.Application, []}
    ]
  end

  defp aliases do
    [
      # so that the supervision tree does not start, which would begin indexing, and so that the various fetchers can
      # be started with `ExUnit`'s `start_supervised` for unit testing.
      test: "test --no-start"
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Due to the way we build the image, we have to include the deps here
      {:plug_cowboy, "~> 2.0"},
      {:poison, "~> 4.0.1"},
      # Optional dependency of `:spandex` for `Spandex.Decorators`
      {:decorator, "~> 1.4"},
      # JSONRPC access to Nethermind for `Explorer.Indexer`
      {:ethereum_jsonrpc, in_umbrella: true},
      # RLP encoding
      {:ex_rlp, "~> 0.6.0"},
      # Importing to database
      {:explorer, in_umbrella: true},
      # libsecp2561k1 crypto functions
      {:libsecp256k1, "~> 0.1.10"},
      # Log errors and application output to separate files
      {:logger_file_backend, "~> 0.0.10"},
      # Mocking `EthereumJSONRPC.Transport`, so we avoid hitting real chains for local testing
      {:mox, "~> 1.0", only: [:test]},
      # Tracing
      {:spandex, "~> 3.0"},
      # `:spandex` integration with Datadog
      {:spandex_datadog, "~> 1.0"},
      # Log json format
      {:logger_json, "~> 3.2"},
      {:jason, "~> 1.3"},
      # Metrics
      {:telemetry, "~> 1.0", override: true},
      # Erlang cluster formation
      {:libcluster, "~> 3.3"}
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["test/support" | elixirc_paths(:dev)]
  defp elixirc_paths(_), do: ["lib"]
end
