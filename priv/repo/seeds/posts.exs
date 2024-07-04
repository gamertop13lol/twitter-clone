defmodule TwitterCloneElixir.Repo.Seeds.Posts do
  alias TwitterCloneElixir.Repo
  alias TwitterCloneElixir.Posts.Post
  alias TwitterCloneElixir.Posts
  alias TwitterCloneElixir.Accounts.User

  def run do
    case Repo.all(Post) do
      [] -> seed_posts()
      _ -> Mix.shell().error("Já existem posts na base de dados!")
    end
  end

  def seed_posts do
    users = Repo.all(User)
    for i <- 0..10 do
      title = "Um monólogo sobre a grande ciência de #{i}"
      body = "Objection: aqui estão os meus argumentos para provar que #{i} é a melhor solução e #{i-1} está errado."
      user_id = Enum.at(users, i).id
      post = %{title: title, body: body, user_id: user_id}
      Posts.create_post(post)
    end
  end
end

TwitterCloneElixir.Repo.Seeds.Posts.run()
