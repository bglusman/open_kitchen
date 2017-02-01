defmodule OpenKitchen.SupplyTest do
  use OpenKitchen.ModelCase

  alias OpenKitchen.Supply

  @valid_attrs %{dairy: true, food_group: 42, halal: true, kosher: true, location: "some content", name: "some content", portion_weight_in_grams: 42, portions: 42, vegan: true, vegetarian: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Supply.changeset(%Supply{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Supply.changeset(%Supply{}, @invalid_attrs)
    refute changeset.valid?
  end
end
