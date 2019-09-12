defmodule ProjetGothamWeb.WorkingTimeController do
  use ProjetGothamWeb, :controller
  alias ProjetGotham.Repo
  alias ProjetGotham.Workingtime
  alias ProjetGothamWeb.ErrorView

  import Ecto.Query
  require Logger

  def index(conn, params) do
    workingtimes = Repo.all(Workingtime)
    render(conn, "index.json", workingtimes: workingtimes)
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
    workingtime = Map.put(workingtime, "start", ~N[2019-09-11 17:47:29])
    workingtime = Map.put(workingtime, "end", ~N[2019-09-11 17:47:29])
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

  def update(conn, %{"userid" => id} = params) do
  
  end

  def delete(conn, %{"userid" => id}) do
    
  end

end