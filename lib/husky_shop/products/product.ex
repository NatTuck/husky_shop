defmodule HuskyShop.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset


  schema "products" do
    field :desc, :string
    field :inventory, :integer
    field :name, :string
    field :price, :decimal
    has_many :ratings, HuskyShop.Ratings.Rating
    many_to_many :suggestions, HuskyShop.Products.Product,
      join_through: "suggestions",
      join_keys: [product_id: :id, suggested_id: :id]

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :desc, :price, :inventory])
    |> validate_required([:name, :desc, :price, :inventory])
  end
end
