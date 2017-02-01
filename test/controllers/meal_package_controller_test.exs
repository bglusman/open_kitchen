defmodule OpenKitchen.MealPackageControllerTest do
  use OpenKitchen.ConnCase

  alias OpenKitchen.MealPackage
  @valid_attrs %{expiration: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, location: "some content", picked_up: true, ready: true, servings: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, meal_package_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing meal packages"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, meal_package_path(conn, :new)
    assert html_response(conn, 200) =~ "New meal package"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, meal_package_path(conn, :create), meal_package: @valid_attrs
    assert redirected_to(conn) == meal_package_path(conn, :index)
    assert Repo.get_by(MealPackage, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, meal_package_path(conn, :create), meal_package: @invalid_attrs
    assert html_response(conn, 200) =~ "New meal package"
  end

  test "shows chosen resource", %{conn: conn} do
    meal_package = Repo.insert! %MealPackage{}
    conn = get conn, meal_package_path(conn, :show, meal_package)
    assert html_response(conn, 200) =~ "Show meal package"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, meal_package_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    meal_package = Repo.insert! %MealPackage{}
    conn = get conn, meal_package_path(conn, :edit, meal_package)
    assert html_response(conn, 200) =~ "Edit meal package"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    meal_package = Repo.insert! %MealPackage{}
    conn = put conn, meal_package_path(conn, :update, meal_package), meal_package: @valid_attrs
    assert redirected_to(conn) == meal_package_path(conn, :show, meal_package)
    assert Repo.get_by(MealPackage, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    meal_package = Repo.insert! %MealPackage{}
    conn = put conn, meal_package_path(conn, :update, meal_package), meal_package: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit meal package"
  end

  test "deletes chosen resource", %{conn: conn} do
    meal_package = Repo.insert! %MealPackage{}
    conn = delete conn, meal_package_path(conn, :delete, meal_package)
    assert redirected_to(conn) == meal_package_path(conn, :index)
    refute Repo.get(MealPackage, meal_package.id)
  end
end
