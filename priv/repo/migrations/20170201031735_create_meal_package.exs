defmodule OpenKitchen.Repo.Migrations.CreateMealPackage do
  use Ecto.Migration

  def change do
    create table(:meal_packages) do
      add :location, :string
      add :servings, :integer
      add :ready, :boolean, default: false, null: false
      add :picked_up, :boolean, default: false, null: false
      add :expiration, :datetime
      add :guest_id, references(:guests, on_delete: :nothing)
      timestamps()
    end

  end
end
