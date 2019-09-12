defmodule ProjetGothamWeb.ClockController do
  use ProjetGothamWeb, :controller
  alias ProjetGotham.Repo
  alias ProjetGotham.Clock
  alias ProjetGothamWeb.ErrorView

  import Ecto.Query
  require Logger

  def index(conn, params) do
    query = from c in Clock,
        where: c.user == ^params["userid"]
    clocks = Repo.all(query)
    render conn, clock: clocks
  end

  def create(conn, params) do
    changeset = Clock.changeset(%Clock{}, params)
    case Repo.insert(changeset) do
      {:ok, clock} ->
        conn
        |> send_resp(201, "")
      {:error, _changeset} ->
        conn
        |> send_resp(500, "")
    end
  
  end

end