defmodule OpenKitchen.Repo.Migrations.CreateGuest do
  use Ecto.Migration

  def change do
    create table(:guests) do
      add :email, :string
      add :name, :string
      add :phone, :string
      add :ok_to_text, :boolean, default: false, null: false
      add :family_members, :integer
      add :language, :integer
      add :kosher, :boolean, default: false, null: false
      add :halal, :boolean, default: false, null: false
      add :dairy, :boolean, default: false, null: false
      add :vegetarian, :boolean, default: false, null: false
      add :vegan, :boolean, default: false, null: false
      add :allergies, :string
      add :dietary_restriction, :string

      timestamps()
    end

  end
end
