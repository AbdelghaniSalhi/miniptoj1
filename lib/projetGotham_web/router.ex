defmodule ProjetGothamWeb.Router do
  use ProjetGothamWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ProjetGothamWeb do
    pipe_through :api
  end

end
