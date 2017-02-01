defmodule OpenKitchen.MealComponentControllerTest do
  use OpenKitchen.ConnCase

  alias OpenKitchen.MealComponent
  @valid_attrs %{meal_package_id: 42, supply_id: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, meal_component_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing meal component"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, meal_component_path(conn, :new)
    assert html_response(conn, 200) =~ "New meal component"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, meal_component_path(conn, :create), meal_component: @valid_attrs
    assert redirected_to(conn) == meal_component_path(conn, :index)
    assert Repo.get_by(MealComponent, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, meal_component_path(conn, :create), meal_component: @invalid_attrs
    assert html_response(conn, 200) =~ "New meal component"
  end

  test "shows chosen resource", %{conn: conn} do
    meal_component = Repo.insert! %MealComponent{}
    conn = get conn, meal_component_path(conn, :show, meal_component)
    assert html_response(conn, 200) =~ "Show meal component"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, meal_component_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    meal_component = Repo.insert! %MealComponent{}
    conn = get conn, meal_component_path(conn, :edit, meal_component)
    assert html_response(conn, 200) =~ "Edit meal component"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    meal_component = Repo.insert! %MealComponent{}
    conn = put conn, meal_component_path(conn, :update, meal_component), meal_component: @valid_attrs
    assert redirected_to(conn) == meal_component_path(conn, :show, meal_component)
    assert Repo.get_by(MealComponent, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    meal_component = Repo.insert! %MealComponent{}
    conn = put conn, meal_component_path(conn, :update, meal_component), meal_component: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit meal component"
  end

  test "deletes chosen resource", %{conn: conn} do
    meal_component = Repo.insert! %MealComponent{}
    conn = delete conn, meal_component_path(conn, :delete, meal_component)
    assert redirected_to(conn) == meal_component_path(conn, :index)
    refute Repo.get(MealComponent, meal_component.id)
  end
end
