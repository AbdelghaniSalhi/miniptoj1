defmodule ProjetGothamWeb.UserView do
    use ProjetGothamWeb, :view
    alias ProjetGothamWeb.UserView
    require Logger

  
    def render("index.json", %{user: user}) do
      %{data: render_many(user, UserView, "users.json")}
      
    end
  
    def render("show.json", %{user: user}) do
      Logger.info(inspect(user))

      %{data: render_one(user, UserView, "users.json")}
    end
  
    def render("users.json", %{user: user}) do
      Logger.info(inspect(user))
      %{id: user.id, user: user.username, email: user.email}
    end
  end