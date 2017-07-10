defmodule PolymorphicAssociation.PageController do
  use PolymorphicAssociation.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
