defmodule PhoenixBlog.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhoenixBlog.Blog.Tag
  alias PhoenixBlog.Repo

  schema "posts" do
    field :title, :string
    many_to_many :tags, Tag, join_through: "posts_tags"

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end

  def add_tag(post, tag) do
    post_with_tags = post |> Repo.preload(:tags)
    change(post_with_tags)
    |> put_assoc(:tags, post_with_tags.tags ++ [tag])
    |> Repo.update()
  end
end
