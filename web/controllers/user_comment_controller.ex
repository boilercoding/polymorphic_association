defmodule PolymorphicAssociation.UserCommentController do
  use PolymorphicAssociation.Web, :controller
  alias PolymorphicAssociation.User
  alias PolymorphicAssociation.Comment
  alias PolymorphicAssociation.UserView

  def create(conn, %{"comment" => comment_params, "user_id" => user_id}) do
    user = Repo.get!(User, user_id)
    comments = Repo.all(assoc(user, :comments))
    changeset = Comment.changeset(%Comment{assoc_id: user.id}, comment_params)
    if changeset.valid? do
      Repo.insert(build_assoc(user, :comments, body: comment_params["body"]))

      conn
      |> put_flash(:info, "Comment created successfully.")
      |> redirect(to: user_path(conn, :show, user))
    else
      render(conn, UserView, :show, user: user, changeset: changeset, comments: comments)
    end
  end
end
