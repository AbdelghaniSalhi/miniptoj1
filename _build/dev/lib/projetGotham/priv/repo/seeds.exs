# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ProjetGotham.Repo.insert!(%ProjetGotham.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias ProjetGotham.Repo
alias ProjetGotham.User
alias ProjetGotham.Clock
alias ProjetGotham.Workingtime


Repo.insert! %User{
    username: "Alexandre",
    email: "alexandre@epitech.eu"
}

Repo.insert! %User{
    username: "Test",
    email: "test@test.fr"
}

Repo.insert! %Workingtime{
    start: ~N[2000-01-01 23:00:07],
    end: ~N[2000-01-01 23:00:07],
    user: 3
}

Repo.insert! %Clock{
    time: ~N[2000-01-01 23:00:07],
    status: true,
    user: 27
}
