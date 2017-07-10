defmodule PolymorphicAssociation.Comment do
  use PolymorphicAssociation.Web, :model

  schema "comments" do
    field :assoc_id, :integer
    field :body, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:assoc_id, :body])
    |> validate_required([:assoc_id, :body])
  end
end
