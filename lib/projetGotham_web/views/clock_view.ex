defmodule ProjetGothamWeb.ClockView do
    use ProjetGothamWeb, :view
    alias ProjetGothamWeb.ClockView
    require Logger

  
    def render("index.json", %{clock: clocks}) do
      %{data: render_many(clocks, ClockView, "clocks.json")}
      
    end
  
    def render("clocks.json", %{clock: clock}) do
      Logger.info(inspect(clock))
      %{id: clock.id, status: clock.status, time: clock.time, user: clock.user}
    end
  end