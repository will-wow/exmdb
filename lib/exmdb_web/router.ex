defmodule ExmdbWeb.Router do
  use ExmdbWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ExmdbWeb do
    pipe_through :api

    get "/best_friends", BestFriendController, :index
  end
end
