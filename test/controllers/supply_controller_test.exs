defmodule OpenKitchen.SupplyControllerTest do
  use OpenKitchen.ConnCase

  alias OpenKitchen.Supply
  @valid_attrs %{dairy: true, food_group: 42, halal: true, kosher: true, location: "some content", name: "some content", portion_weight_in_grams: 42, portions: 42, vegan: true, vegetarian: true}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, supply_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing supplies"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, supply_path(conn, :new)
    assert html_response(conn, 200) =~ "New supply"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, supply_path(conn, :create), supply: @valid_attrs
    assert redirected_to(conn) == supply_path(conn, :index)
    assert Repo.get_by(Supply, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, supply_path(conn, :create), supply: @invalid_attrs
    assert html_response(conn, 200) =~ "New supply"
  end

  test "shows chosen resource", %{conn: conn} do
    supply = Repo.insert! %Supply{}
    conn = get conn, supply_path(conn, :show, supply)
    assert html_response(conn, 200) =~ "Show supply"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, supply_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    supply = Repo.insert! %Supply{}
    conn = get conn, supply_path(conn, :edit, supply)
    assert html_response(conn, 200) =~ "Edit supply"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    supply = Repo.insert! %Supply{}
    conn = put conn, supply_path(conn, :update, supply), supply: @valid_attrs
    assert redirected_to(conn) == supply_path(conn, :show, supply)
    assert Repo.get_by(Supply, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    supply = Repo.insert! %Supply{}
    conn = put conn, supply_path(conn, :update, supply), supply: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit supply"
  end

  test "deletes chosen resource", %{conn: conn} do
    supply = Repo.insert! %Supply{}
    conn = delete conn, supply_path(conn, :delete, supply)
    assert redirected_to(conn) == supply_path(conn, :index)
    refute Repo.get(Supply, supply.id)
  end
end
