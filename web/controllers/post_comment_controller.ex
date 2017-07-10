defmodule PolymorphicAssociation.UserCommentController do
  use PolymorphicAssociation.Web, :controller
  alias PolymorphicAssociation.User

  def create(conn, %{"comment" => comment_params, "user_id" => user_id}) do
    user = Repo.get!(User, user_id)
    comments = Repo.all(assoc(user, :comments))
    changeset = Ecto.build_assoc(user, :comments, body: comment_params["body"])
    Repo.insert(changeset)

    conn
    |> put_flash(:info, "Comment created successfully.")
    |> redirect(to: user_path(conn, :show, user))
  end
end
