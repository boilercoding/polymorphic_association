defmodule PolymorphicAssociation.PostCommentController do
  use PolymorphicAssociation.Web, :controller
  alias PolymorphicAssociation.Post
  alias PolymorphicAssociation.Comment
  alias PolymorphicAssociation.PostView

  def create(conn, %{"comment" => comment_params, "post_id" => post_id}) do
    post = Repo.get!(Post, post_id)
    comments = Repo.all(assoc(post, :comments))
    changeset = Comment.changeset(%Comment{assoc_id: post.id}, comment_params)
    if changeset.valid? do
      Repo.insert(build_assoc(post, :comments, body: comment_params["body"]))

      conn
      |> put_flash(:info, "Comment created successfully.")
      |> redirect(to: post_path(conn, :show, post))
    else
      render(conn, PostView, :show, post: post, changeset: changeset, comments: comments)
    end
  end
end
