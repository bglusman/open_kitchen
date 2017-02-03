defmodule OpenKitchen.Repo.Migrations.AddEnums do
  use Ecto.Migration


  def up do
    FoodGroup.create_type
    alter table(:supplies) do
      remove :food_group
      add :food_group, :food_group
    end
  end

  def down do
    alter table(:supplies) do
      remove :food_group
      add :food_group, :integer
    end
    FoodGroup.drop_type
  end

end
