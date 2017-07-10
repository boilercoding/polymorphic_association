# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PolymorphicAssociation.Repo.insert!(%PolymorphicAssociation.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

PolymorphicAssociation.Repo.delete_all PolymorphicAssociation.User
(1..10) |> Enum.each(fn n ->
  PolymorphicAssociation.User.changeset(%PolymorphicAssociation.User{}, %{name: "Test User#{n}"})
  |> PolymorphicAssociation.Repo.insert!
end)

PolymorphicAssociation.Repo.delete_all PolymorphicAssociation.Post
(1..10) |> Enum.each(fn n ->
  PolymorphicAssociation.Post.changeset(%PolymorphicAssociation.Post{}, %{title: "Test Post#{n}"})
  |> PolymorphicAssociation.Repo.insert!
end)
