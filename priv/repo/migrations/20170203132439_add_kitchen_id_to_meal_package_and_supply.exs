defmodule OpenKitchen.Repo.Migrations.AddKitchenIdToMealPackageAndSupply do
  use Ecto.Migration

  def change do
    alter table(:meal_packages) do
      add :kitchen_id, references(:kitchens, on_delete: :nothing)
    end
    alter table(:supplies) do
      add :kitchen_id, references(:kitchens, on_delete: :nothing)
    end
    create index(:meal_packages, [:kitchen_id])
    create index(:supplies, [:kitchen_id])
  end
end
