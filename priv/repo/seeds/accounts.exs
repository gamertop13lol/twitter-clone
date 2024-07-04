defmodule TwitterCloneElixir.Repo.Seeds.Accounts do
  alias TwitterCloneElixir.Repo
  alias TwitterCloneElixir.Accounts.User
  alias TwitterCloneElixir.Accounts

  def run do
    case Repo.all(User) do
      [] -> seed_users()
      _ -> Mix.shell().error("Já existem contas na base de dados!")
    end
  end

  def seed_users do
    for i <- 0..10 do
      email = "user#{i}@email.com"
      password = "password1234"
      username = "User#{i}"
      user = %{email: email, password: password, username: username}
      Accounts.register_user(user)
    end
  end
end

TwitterCloneElixir.Repo.Seeds.Accounts.run()
