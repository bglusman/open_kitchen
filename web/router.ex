defmodule OpenKitchen.Router do
  use OpenKitchen.Web, :router
  use ExAdmin.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/admin", ExAdmin do
    pipe_through :browser
    admin_routes()
  end

  scope "/", OpenKitchen do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/guests", GuestController
    resources "/supplies", SupplyController
    resources "/meal_packages", MealPackageController
    resources "/meal_components", MealComponentController
  end

  # Other scopes may use custom stacks.
  # scope "/api", OpenKitchen do
  #   pipe_through :api
  # end
end
