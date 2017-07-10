defmodule PolymorphicAssociation.Repo.Migrations.CreatePostComment do
  use Ecto.Migration

  def change do
    create table(:posts_comments) do
      add :assoc_id, :integer
      add :body, :text

      timestamps()
    end
  end
end
