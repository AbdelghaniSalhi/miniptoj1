defmodule ProjetGothamWeb.Router do
  use ProjetGothamWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ProjetGothamWeb do
    pipe_through :api
  
    scope"/users" do
      get "/", UserController, :index
      get "/:userid", UserController, :show
      post "/", UserController, :create
      put "/:userid", UserController, :update
      delete "/:userid", UserController, :delete
    end
  
    scope "/clocks" do
      get "/:userid", ClockController, :index
      post "/:userid", ClockController, :create
    end
  
    scope "/workingtimes" do
      get "/:userid", WorkingTimeController, :index
      get "/:userid/:workingtimeid", WorkingTimeController, :show
      post "/:user", WorkingTimeController, :create
      put "/:id", WorkingTimeController, :update
      delete "/:id", WorkingTimeController, :delete
    end
  end
end
