defmodule PolymorphicAssociation.User do
  use PolymorphicAssociation.Web, :model

  alias PolymorphicAssociation.Comment

  schema "users" do
    field :name, :string
    has_many :comments, {"users_comments", Comment}, foreign_key: :assoc_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
