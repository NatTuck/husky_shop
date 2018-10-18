defmodule HuskyShopWeb.Router do
  use HuskyShopWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug HuskyShopWeb.Plugs.FetchSession
  end

  pipeline :ajax do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_flash
    plug HuskyShopWeb.Plugs.FetchSession # FIXME: "FetchUser"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HuskyShopWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/products", ProductController
    resources "/users", UserController
    resources "/cart_items", CartItemController
    resources "/sessions", SessionController, only: [:create, :delete], singleton: true
  end

  scope "/ajax", HuskyShopWeb do
    pipe_through :ajax
    resources "/ratings", RatingController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", HuskyShopWeb do
  #   pipe_through :api
  # end
end
