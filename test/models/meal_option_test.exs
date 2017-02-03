defmodule OpenKitchen.MealOptionTest do
  use OpenKitchen.ModelCase

  alias OpenKitchen.MealOption

  @valid_attrs %{description: "some content", food_groups: 42, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = MealOption.changeset(%MealOption{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = MealOption.changeset(%MealOption{}, @invalid_attrs)
    refute changeset.valid?
  end
end
