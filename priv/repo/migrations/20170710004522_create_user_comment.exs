defmodule PolymorphicAssociation.Repo.Migrations.CreateUserComment do
  use Ecto.Migration

  def change do
    create table(:users_comments) do
      add :assoc_id, :integer
      add :body, :text

      timestamps()
    end
  end
end
