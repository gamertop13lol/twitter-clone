defmodule TwitterCloneElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TwitterCloneElixirWeb.Telemetry,
      TwitterCloneElixir.Repo,
      {DNSCluster, query: Application.get_env(:twitter_clone_elixir, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TwitterCloneElixir.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: TwitterCloneElixir.Finch},
      # Start a worker by calling: TwitterCloneElixir.Worker.start_link(arg)
      # {TwitterCloneElixir.Worker, arg},
      # Start to serve requests, typically the last entry
      TwitterCloneElixirWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TwitterCloneElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TwitterCloneElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
