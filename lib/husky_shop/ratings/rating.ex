defmodule HuskyShop.Ratings.Rating do
  use Ecto.Schema
  import Ecto.Changeset


  schema "ratings" do
    field :stars, :integer
    belongs_to :user, HuskyShop.Users.User
    belongs_to :product, HuskyShop.Products.Product

    timestamps()
  end

  @doc false
  def changeset(rating, attrs) do
    rating
    |> cast(attrs, [:stars, :user_id, :product_id])
    |> validate_required([:stars, :user_id, :product_id])
  end
end
