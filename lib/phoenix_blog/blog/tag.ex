defmodule PhoenixBlog.Blog.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhoenixBlog.Blog.Post

  schema "tags" do
    field :name, :string
    many_to_many :posts, Post, join_through: "posts_tags"

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
