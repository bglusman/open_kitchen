defmodule OpenKitchen.Repo.Migrations.CreateMealSelectionAndMissedIndexes do
  use Ecto.Migration

  def change do
    create table(:meal_selections) do
      add :meal_option_id, references(:meal_options, on_delete: :nothing)
      add :meal_package_id, references(:meal_packages, on_delete: :nothing)

      timestamps()
    end
    create index(:meal_selections, [:meal_option_id])
    create index(:meal_selections, [:meal_package_id])
    create index(:guests, [:kitchen_id])
    create index(:guests, [:language_id])
    create index(:meal_component, [:meal_package_id])
    create index(:meal_component, [:supply_id])
    create index(:meal_packages, [:guest_id])

  end
end
