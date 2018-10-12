defmodule HuskyShop.Carts.CartItem do
  use Ecto.Schema
  import Ecto.Changeset


  schema "cart_items" do
    field :count, :integer
    field :user_id, :id
    field :product_id, :id

    timestamps()
  end

  @doc false
  def changeset(cart_item, attrs) do
    cart_item
    |> cast(attrs, [:count])
    |> validate_required([:count])
  end
end
