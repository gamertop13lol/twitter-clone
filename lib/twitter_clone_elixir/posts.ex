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
  end
end
