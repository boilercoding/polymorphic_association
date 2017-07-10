defmodule PolymorphicAssociation.Post do
  use PolymorphicAssociation.Web, :model

  schema "posts" do
    field :title, :string

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
