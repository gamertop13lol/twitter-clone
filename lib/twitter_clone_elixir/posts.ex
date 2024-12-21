defmodule TwitterCloneElixir.Posts do
  @moduledoc """
  The Posts context.
  """

  import Ecto.Query, warn: false
  alias TwitterCloneElixir.Repo
  alias TwitterCloneElixir.Posts.Post

  def create_post(attrs) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  def list_posts do
    Repo.all(Post)
    |> Repo.preload(:user)
  end

  def get_post(id) do
    Repo.get(Post, id)
    |> Repo.preload(:user)
  end

  def search_posts(title) do
    Post
    |> where([p], ilike(p.title, ^"%#{title}%"))
    |> Repo.all()
    |> Repo.preload(:user)
  end
end
