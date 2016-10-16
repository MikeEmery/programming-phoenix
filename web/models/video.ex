defmodule Rumbl.Video do
  use Rumbl.Web, :model

  @required_params [:url, :title, :description]
  @optional_params [:category_id]

  schema "videos" do
    field :url, :string
    field :title, :string
    field :description, :string

    belongs_to :user, Rumbl.User
    belongs_to :category, Rumbl.Category

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_params, @optional_params)
    |> validate_required(@required_params)
    |> assoc_constraint(:category)
  end
end
