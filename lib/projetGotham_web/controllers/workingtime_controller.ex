defmodule ProjetGothamWeb.WorkingTimeController do
  use ProjetGothamWeb, :controller
  alias ProjetGotham.Repo
  alias ProjetGotham.Workingtime
  alias ProjetGothamWeb.ErrorView

  import Ecto.Query
  require Logger

  def index(conn, params) do
    query = from w in Workingtime, where: w.user == ^params["userid"]
    with wt = Repo.all(query) do
      conn
      |> put_status(200)
      |> render "index.json", workingtimes: wt
    else
      nil ->
        conn
        |> send_resp(404, "Not found")
    end
  end

  defp getStart(params) do 
    if(params["start"]) do
      returnValue = "%" <> params["start"] <> "%"
    else
      returnValue = "%"
    end
  end

  defp getEnd(params) do 
    if(params["end"]) do
      returnValue = "%" <> params["end"] <> "%"
    else
      returnValue = "%"
    end
  end

  def show(conn, %{"userid" => uid, "workingtimeid" => wtid}) do
    query = from w in Workingtime, where: w.id == ^wtid and w.user == ^uid
    with wt = %Workingtime{} <- Repo.one(query) do
      conn
      |> put_status(200)
      |> render "show.json", working_time: wt
    else
      nil ->
        conn
        |> send_resp(404, "Not found")
    end
  end


  def create(conn, workingtime) do
    wtstart = (workingtime["start"])
    wtend = (workingtime["end"])
    workingtime = Map.put(workingtime, "start", wtstart)
    workingtime = Map.put(workingtime, "end", wtstart)
    changeset = Workingtime.changeset(%Workingtime{}, workingtime)
    case Repo.insert(changeset) do
      {:ok, workingtime} ->
        conn
        |> send_resp(201, "")
      {:error, _changeset} ->
        conn
        |> send_resp(500, "")
    end
        
  end

  def update(conn, %{"id" => id} = params) do
    wt = Repo.get(Workingtime, id)
    with wt = %Workingtime{} <- Repo.get(Workingtime, id) do
      changeset = Workingtime.changeset(wt, params)
      case Repo.update(changeset) do
        {:ok, wt} ->
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

  def delete(conn, %{"id" => id}) do
    wt = Repo.get(Workingtime, id)
    with wt = %Workingtime{} <- Repo.get(Workingtime, id) do
      Repo.delete!(wt)
      conn
      |> send_resp(200, "")
    else
      nil ->
        conn
        |> send_resp(404, "")
    end
  end

end