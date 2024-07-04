defmodule TwitterCloneElixir.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias TwitterCloneElixir.Accounts.User

  schema "posts" do
    field :title, :string
    field :body, :string
    belongs_to :user, User
  end

  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :user_id])
    |> validate_length(:body, min: 1, max: 500)
  end
end
