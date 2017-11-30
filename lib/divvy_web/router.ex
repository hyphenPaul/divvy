defmodule DivvyWeb.Router do
  use DivvyWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug DivvyWeb.Auth
  end

  #pipeline :api do
    #plug :accepts, ["json"]
  #end

  scope "/", DivvyWeb do
    pipe_through :browser

    get "/", PageController, :index

    get "/login", SessionController, :new
    resources "/sessions", SessionController, only: [:create, :delete]

    get "/register", UserController, :new
    post "/register/create", UserController, :create
  end

  scope "/", DivvyWeb do
    pipe_through [:browser, :authenticate_user]

    resources "/events", EventController
    resources "/users", UserController, only: [:show, :edit, :update]

    resources "/gifts", GiftController, only: [:create, :delete]
    get "/gifts/new/:event_id", GiftController, :new

    post "/comments", CommentController, :create
    delete "/comments/:id/:event_id", CommentController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", DivvyWeb do
  #   pipe_through :api
  # end
end
