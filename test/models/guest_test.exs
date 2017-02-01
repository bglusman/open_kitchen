defmodule OpenKitchen.GuestTest do
  use OpenKitchen.ModelCase

  alias OpenKitchen.Guest

  @valid_attrs %{allergies: "some content", dairy: true, dietary_restriction: "some content", email: "some content", family_members: 42, halal: true, kosher: true, language: 42, name: "some content", ok_to_text: true, phone: "some content", vegan: true, vegetarian: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Guest.changeset(%Guest{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Guest.changeset(%Guest{}, @invalid_attrs)
    refute changeset.valid?
  end
end
