defmodule TwitterCloneElixir.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :string
      add :user_id, references(:users, on_delete: :delete_all, type: :bigint)
    end
  end
end
