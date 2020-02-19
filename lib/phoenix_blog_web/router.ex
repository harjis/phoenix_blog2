defmodule PhoenixBlogWeb.Router do
  use PhoenixBlogWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhoenixBlogWeb do
    pipe_through :api
  end
end
