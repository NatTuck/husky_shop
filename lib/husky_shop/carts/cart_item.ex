defmodule HuskyShop.Carts.CartItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cart_items" do
    field :count, :integer
    belongs_to :user, HuskyShop.Users.User
    belongs_to :product, HuskyShop.Products.Product

    timestamps()
  end

  @doc false
  def changeset(cart_item, attrs) do
    cart_item
    |> cast(attrs, [:count, :user_id, :product_id])
    |> validate_required([:count, :user_id, :product_id])
  end
end