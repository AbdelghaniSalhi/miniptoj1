defmodule ProjetGotham.Repo do
  use Ecto.Repo,
    otp_app: :projetGotham,
    adapter: Ecto.Adapters.Postgres
end
