defmodule OpenKitchen.Repo.Migrations.CreateSupply do
  use Ecto.Migration

  def change do
    create table(:supplies) do
      add :name, :string
      add :location, :string
      add :portions, :integer
      add :portion_weight_in_grams, :integer
      add :kosher, :boolean, default: false, null: false
      add :halal, :boolean, default: false, null: false
      add :dairy, :boolean, default: false, null: false
      add :vegetarian, :boolean, default: false, null: false
      add :vegan, :boolean, default: false, null: false
      add :food_group, :integer

      timestamps()
    end

  end
end
