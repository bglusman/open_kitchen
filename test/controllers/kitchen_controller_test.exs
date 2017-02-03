defmodule OpenKitchen.KitchenControllerTest do
  use OpenKitchen.ConnCase

  alias OpenKitchen.Kitchen
  @valid_attrs %{kitchen_name: "some content", location: 42, max_occupancy: 42, square_meterage_storage: "120.5"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, kitchen_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing kitchens"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, kitchen_path(conn, :new)
    assert html_response(conn, 200) =~ "New kitchen"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, kitchen_path(conn, :create), kitchen: @valid_attrs
    assert redirected_to(conn) == kitchen_path(conn, :index)
    assert Repo.get_by(Kitchen, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, kitchen_path(conn, :create), kitchen: @invalid_attrs
    assert html_response(conn, 200) =~ "New kitchen"
  end

  test "shows chosen resource", %{conn: conn} do
    kitchen = Repo.insert! %Kitchen{}
    conn = get conn, kitchen_path(conn, :show, kitchen)
    assert html_response(conn, 200) =~ "Show kitchen"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, kitchen_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    kitchen = Repo.insert! %Kitchen{}
    conn = get conn, kitchen_path(conn, :edit, kitchen)
    assert html_response(conn, 200) =~ "Edit kitchen"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    kitchen = Repo.insert! %Kitchen{}
    conn = put conn, kitchen_path(conn, :update, kitchen), kitchen: @valid_attrs
    assert redirected_to(conn) == kitchen_path(conn, :show, kitchen)
    assert Repo.get_by(Kitchen, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    kitchen = Repo.insert! %Kitchen{}
    conn = put conn, kitchen_path(conn, :update, kitchen), kitchen: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit kitchen"
  end

  test "deletes chosen resource", %{conn: conn} do
    kitchen = Repo.insert! %Kitchen{}
    conn = delete conn, kitchen_path(conn, :delete, kitchen)
    assert redirected_to(conn) == kitchen_path(conn, :index)
    refute Repo.get(Kitchen, kitchen.id)
  end
end
