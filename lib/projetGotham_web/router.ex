defmodule ProjetGothamWeb.Router do
  use ProjetGothamWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ProjetGothamWeb do
    pipe_through :api
  
    scope"/api" ProjetGothamWeb do
      get "/", UserController, :index
      get "/:UserID", UserController :show
      post "/", UserController, :create
      put "/:userID", UserController, :update
      delete "/:userID", UserController, :delete
    end
  
    scope "/clocks" do
      get "/:userID", ClockController, :index
      post "/:userID", ClockController, :create
    end
  
    scope "/workingtimes" do
      get "/:userID", WorkingTimesController, :index
      get "/:userID/:workingtimeID", WorkingTimesController, :show
      post "/:userID", WorkingTimesController :create
      put "/:iD", WorkingTimesController :update
      delete "/:iD" WorkingTimesController :delete
    end
  end
end
