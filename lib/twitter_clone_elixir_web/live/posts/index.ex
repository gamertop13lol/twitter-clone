defmodule TwitterCloneElixirWeb.PostLive.Index do
  use TwitterCloneElixirWeb, :live_view

  alias TwitterCloneElixir.Posts

  def mount(_params, _session, socket) do
    form = to_form(%{}, as: "post")
    posts = Posts.list_posts()
    {:ok, assign(socket, :posts, posts) |> assign(:form, form)}
  end

  def handle_event("search", %{"post" => title}, socket) do
    posts = Posts.search_posts(title)
    {:noreply, assign(socket, :posts, posts)}
  end
end
