defmodule OpenKitchen.Repo.Migrations.CreateMealComponent do
  use Ecto.Migration

  def change do
    create table(:meal_component) do
      add :meal_package_id, references(:meal_packages, on_delete: :nothing)
      add :supply_id, references(:supplies, on_delete: :nothing)

      timestamps()
    end

  end
end
