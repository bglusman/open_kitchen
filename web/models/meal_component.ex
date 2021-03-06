defmodule OpenKitchen.MealComponent do
  use OpenKitchen.Web, :model

  schema "meal_component" do
    belongs_to :supply, OpenKitchen.Supply
    belongs_to :meal_package, OpenKitchen.MealPackage

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:meal_package_id, :supply_id])
    |> validate_required([:meal_package_id, :supply_id])
  end
end
