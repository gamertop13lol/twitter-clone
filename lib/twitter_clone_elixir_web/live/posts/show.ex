defmodule TwitterCloneElixirWeb.PostLive.Show do
  use TwitterCloneElixirWeb, :live_view

  alias TwitterCloneElixir.Posts

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(%{"id" => id}, _, socket) do
    post = Posts.get_post(id)
    {:noreply, assign(socket, :post, post)}
  end
end
