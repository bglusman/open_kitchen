defmodule OpenKitchen.MealSelectionTest do
  use OpenKitchen.ModelCase

  alias OpenKitchen.MealSelection

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = MealSelection.changeset(%MealSelection{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = MealSelection.changeset(%MealSelection{}, @invalid_attrs)
    refute changeset.valid?
  end
end
