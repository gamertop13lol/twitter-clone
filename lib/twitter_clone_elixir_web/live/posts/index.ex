defmodule TwitterCloneElixirWeb.PostLive.Index do
  use TwitterCloneElixirWeb, :live_view

  alias TwitterCloneElixir.Posts

  def mount(params, session, socket) do
    posts = Posts.list_posts()
    {:ok, assign(socket, :posts, posts)}
  end
end
