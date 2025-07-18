defmodule SmartSchoolWeb.Router do
  use SmartSchoolWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {SmartSchoolWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SmartSchoolWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  # Other scopes may use custom stacks.
  scope "/api", SmartSchoolWeb.Api do
    pipe_through :api

    # check all possible routes for country routes
    # resources "/countries", CountryController
    # resources "/users", UserController
    get "/countries", CountryController, :index
    post "/countries", CountryController, :create

    get "/users", UserController, :index
    get "/users/:id", UserController, :show
    post "/users", UserController, :create
    get "/users/count_by_country/:country_id", UserController, :count_by_country
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:smart_school, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: SmartSchoolWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
