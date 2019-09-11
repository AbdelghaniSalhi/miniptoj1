defmodule ProjetGothamWeb.UserView do
    use ProjetGothamWeb, :view
    alias ProjetGothamWeb.UserView
  
    def render("index.json", %{user: user}) do
      %{data: render_many(user, UserView, "users.json")}
      
    end
  
    def render("show.json", %{user: user}) do
      %{data: render_one(user, UserView, "users.json")}
    end
  
    def render("users.json", %{user: user}) do
      %{id: user.id, user: user.username, email: user.email}
    end
  end