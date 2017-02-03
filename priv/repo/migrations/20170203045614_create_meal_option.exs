defmodule OpenKitchen.Repo.Migrations.CreateMealOption do
  use Ecto.Migration

  def change do
    create table(:meal_options) do
      add :name, :string
      add :description, :string
      add :food_groups, {:array, :food_group}
      add :consumed_supplies, {:array, :integer}

      timestamps()
    end

  end
end
