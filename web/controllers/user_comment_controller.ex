defmodule PolymorphicAssociation.PostCommentController do
  use PolymorphicAssociation.Web, :controller
  alias PolymorphicAssociation.Post

  def create(conn, %{"comment" => comment_params, "post_id" => post_id}) do
    post = Repo.get!(Post, post_id)
    comments = Repo.all(assoc(post, :comments))
    changeset = Ecto.build_assoc(post, :comments, body: comment_params["body"])
    Repo.insert(changeset)

    conn
    |> put_flash(:info, "Comment created successfully.")
    |> redirect(to: post_path(conn, :show, post))
  end
end
