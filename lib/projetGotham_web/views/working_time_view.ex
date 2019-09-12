defmodule ProjetGothamWeb.WorkingTimeView do
    use ProjetGothamWeb, :view
    alias ProjetGothamWeb.WorkingTimeView
    require Logger

    def render("index.json", %{workingtimes: workingtimes}) do
      %{data: render_many(workingtimes, WorkingTimeView, "workingtime.json")}

    end
  
    def render("show.json", %{working_time: working_time}) do
      %{data: render_one(working_time, WorkingTimeView, "workingtime.json")}
    end
  
    def render("workingtime.json", %{working_time: working_time}) do
      %{id: working_time.id, start: working_time.start, end: working_time.end, user: working_time.user}
    end
  end