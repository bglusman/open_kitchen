defmodule OpenKitchen.MealPackageTest do
  use OpenKitchen.ModelCase

  alias OpenKitchen.MealPackage

  @valid_attrs %{expiration: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, location: "some content", picked_up: true, ready: true, servings: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = MealPackage.changeset(%MealPackage{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = MealPackage.changeset(%MealPackage{}, @invalid_attrs)
    refute changeset.valid?
  end
end
