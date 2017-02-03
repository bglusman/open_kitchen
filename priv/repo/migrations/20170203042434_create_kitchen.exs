defmodule OpenKitchen.Repo.Migrations.CreateKitchen do
  use Ecto.Migration

  def change do
    create table(:kitchens) do
      add :kitchen_name, :string
      add :location, :geometry
      add :max_occupancy, :integer
      add :square_meterage_storage, :float

      timestamps()
    end

  end
end
