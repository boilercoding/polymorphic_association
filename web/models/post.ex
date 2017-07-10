defmodule PolymorphicAssociation.Post do
  use PolymorphicAssociation.Web, :model

  alias PolymorphicAssociation.Comment

  schema "posts" do
    field :title, :string
    has_many :comments, {"posts_comments", Comment}, foreign_key: :assoc_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
