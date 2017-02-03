defmodule OpenKitchen.Repo.Migrations.CreateLanguage do
  use Ecto.Migration

  def change do
    create table(:languages) do
      add :iso_code, :string
      add :english_name, :string
      add :native_name, :string

      timestamps()
    end

  end
end
