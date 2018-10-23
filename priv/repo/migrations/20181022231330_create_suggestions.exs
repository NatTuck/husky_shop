defmodule HuskyShop.Repo.Migrations.CreateSuggestions do
  use Ecto.Migration

  def change do
    create table("suggestions") do
      add :product_id, references(:products, on_delete: :delete_all), null: false
      add :suggested_id, references(:products, on_delete: :delete_all), null: false
    end

    create index(:suggestions, [:product_id])
  end
end
