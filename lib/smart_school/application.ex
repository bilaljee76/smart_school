defmodule SmartSchool.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SmartSchoolWeb.Telemetry,
      SmartSchool.Repo,
      {DNSCluster, query: Application.get_env(:smart_school, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SmartSchool.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: SmartSchool.Finch},
      # Start a worker by calling: SmartSchool.Worker.start_link(arg)
      # {SmartSchool.Worker, arg},
      # Start to serve requests, typically the last entry
      SmartSchoolWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SmartSchool.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SmartSchoolWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
