defmodule OpenKitchen.MealSelection do
  use OpenKitchen.Web, :model

  schema "meal_selections" do
    belongs_to :meal_option, OpenKitchen.MealOption
    belongs_to :meal_package, OpenKitchen.MealPackage

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
