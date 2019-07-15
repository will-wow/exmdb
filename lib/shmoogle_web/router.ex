defmodule ShmoogleWeb.Router do
  use ShmoogleWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ShmoogleWeb do
    pipe_through :api
  end
end
