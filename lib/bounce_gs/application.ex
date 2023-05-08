defmodule BounceGs.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      BounceGsWeb.Telemetry,
      # Start the Ecto repository
      BounceGs.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: BounceGs.PubSub},
      # Start Finch
      {Finch, name: BounceGs.Finch},
      # Start the Endpoint (http/https)
      BounceGsWeb.Endpoint
      # Start a worker by calling: BounceGs.Worker.start_link(arg)
      # {BounceGs.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BounceGs.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BounceGsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
