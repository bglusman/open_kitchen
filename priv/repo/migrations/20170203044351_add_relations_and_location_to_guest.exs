defmodule OpenKitchen.Repo.Migrations.AddRelationsAndLocationToGuest do
  use Ecto.Migration

  def change do
    alter table(:guests) do
      remove :language
      add :kitchen_id, references(:kitchens, on_delete: :nothing)
      add :language_id, references(:languages, on_delete: :nothing)
      add :location, :geometry
    end
  end
end
