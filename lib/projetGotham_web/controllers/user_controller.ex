defmodule ProjetGothamWeb.UserController do
  use ProjetGothamWeb, :controller
  alias ProjetGotham.Repo
  alias ProjetGotham.User
  alias ProjetGothamWeb.ErrorView

  import Ecto.Query
  require Logger

  def index(conn, params) do
    username = getUsername(params)
    email = getEmail(params)
    query = from u in User,
            where: like(u.email, ^email) and like(u.username, ^username)
    users = Repo.all(query)
    render conn, user: users
  end

  defp getUsername(params) do 
    if(params["username"]) do
      returnValue = "%" <> params["username"] <> "%"
    else
      returnValue = "%"
    end
  end

  defp getEmail(params) do 
    if(params["email"]) do
      returnValue = "%" <> params["email"] <> "%"
    else
      returnValue = "%"
    end
  end

  def show(conn, %{"userid" => id}) do
    user = Repo.get(User, id)
    with user = %User{} <- Repo.get(User, id) do
      conn
      |> put_status(200)
      |> render user: user
    else
      nil ->
        conn
        |> send_resp(404, "")
    end
  end


  def create(conn, user) do
    changeset = User.changeset(%User{}, user)
    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> send_resp(201, "")
      {:error, _changeset} ->
        conn
        |> send_resp(500, "")
    end
  
  end

  def update(conn, %{"userid" => id} = params) do
    user = Repo.get(User, id)
    with user = %User{} <- Repo.get(User, id) do
      changeset = User.changeset(user, params)
      case Repo.update(changeset) do
        {:ok, user} ->
          conn
          |> send_resp(200, "")
        {:error, _changeset} ->
          conn
          |> send_resp(500, "")
      end
    else
      nil ->
        conn
        |> send_resp(404, "")
    end
  
  end

  def delete(conn, %{"userid" => id}) do
    user = Repo.get(User, id)
    with user = %User{} <- Repo.get(User, id) do
      Repo.delete!(user)
      conn
      |> send_resp(200, "")
    else
      nil ->
        conn
        |> send_resp(404, "")
    end
  end

end