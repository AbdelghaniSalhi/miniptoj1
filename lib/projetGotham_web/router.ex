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
  
    scope "/clocks", ProjetGothamWeb do
      get "/:userid", ClockController, :index
      post "/:userid", ClockController, :create
    end
  
    scope "/workingtimes", ProjetGothamWeb do
      get "/:userid", WorkingTimesController, :index
      get "/:userid/:workingtimeid", WorkingTimesController, :show
      post "/:userid", WorkingTimesController, :create
      put "/:id", WorkingTimesController, :update
      delete "/:id", WorkingTimesController, :delete
    end
  end
end
