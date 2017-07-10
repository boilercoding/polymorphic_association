defmodule PolymorphicAssociation.Router do
  use PolymorphicAssociation.Web, :router

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

  scope "/", PolymorphicAssociation do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/posts", PostController do
      resources "/comments", PostCommentController, only: [:create]
    end
    resources "/users", UserController do
      resources "/comments", UserCommentController, only: [:create]
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", PolymorphicAssociation do
  #   pipe_through :api
  # end
end
