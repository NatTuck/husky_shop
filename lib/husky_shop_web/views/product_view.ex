defmodule HuskyShopWeb.ProductView do
  use HuskyShopWeb, :view

  def avg_rating(product) do
    if Enum.empty?(product.ratings) do
      "??"
    else
      mean = Enum.sum(product.ratings) / Enum.count(product.ratings)
      "#{mean} / 5"
    end
  end
end
