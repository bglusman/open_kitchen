defmodule OpenKitchen.KitchenTest do
  use OpenKitchen.ModelCase

  alias OpenKitchen.Kitchen

  @valid_attrs %{kitchen_name: "some content", location: 42, max_occupancy: 42, square_meterage_storage: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Kitchen.changeset(%Kitchen{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Kitchen.changeset(%Kitchen{}, @invalid_attrs)
    refute changeset.valid?
  end
end
