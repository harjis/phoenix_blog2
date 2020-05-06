defmodule PhoenixBlogWeb.Router do
  use PhoenixBlogWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhoenixBlogWeb do
    pipe_through :api
    resources "/posts", PostController
    get("/posts/show_no_bang/:id", PostController, :show_no_bang)
  end
end
