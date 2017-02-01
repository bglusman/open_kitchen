defmodule OpenKitchen.MealComponentTest do
  use OpenKitchen.ModelCase

  alias OpenKitchen.MealComponent

  @valid_attrs %{meal_package_id: 42, supply_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = MealComponent.changeset(%MealComponent{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = MealComponent.changeset(%MealComponent{}, @invalid_attrs)
    refute changeset.valid?
  end
end
