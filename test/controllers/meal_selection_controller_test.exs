defmodule OpenKitchen.MealSelectionControllerTest do
  use OpenKitchen.ConnCase

  alias OpenKitchen.MealSelection
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, meal_selection_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing meal selections"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, meal_selection_path(conn, :new)
    assert html_response(conn, 200) =~ "New meal selection"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, meal_selection_path(conn, :create), meal_selection: @valid_attrs
    assert redirected_to(conn) == meal_selection_path(conn, :index)
    assert Repo.get_by(MealSelection, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, meal_selection_path(conn, :create), meal_selection: @invalid_attrs
    assert html_response(conn, 200) =~ "New meal selection"
  end

  test "shows chosen resource", %{conn: conn} do
    meal_selection = Repo.insert! %MealSelection{}
    conn = get conn, meal_selection_path(conn, :show, meal_selection)
    assert html_response(conn, 200) =~ "Show meal selection"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, meal_selection_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    meal_selection = Repo.insert! %MealSelection{}
    conn = get conn, meal_selection_path(conn, :edit, meal_selection)
    assert html_response(conn, 200) =~ "Edit meal selection"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    meal_selection = Repo.insert! %MealSelection{}
    conn = put conn, meal_selection_path(conn, :update, meal_selection), meal_selection: @valid_attrs
    assert redirected_to(conn) == meal_selection_path(conn, :show, meal_selection)
    assert Repo.get_by(MealSelection, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    meal_selection = Repo.insert! %MealSelection{}
    conn = put conn, meal_selection_path(conn, :update, meal_selection), meal_selection: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit meal selection"
  end

  test "deletes chosen resource", %{conn: conn} do
    meal_selection = Repo.insert! %MealSelection{}
    conn = delete conn, meal_selection_path(conn, :delete, meal_selection)
    assert redirected_to(conn) == meal_selection_path(conn, :index)
    refute Repo.get(MealSelection, meal_selection.id)
  end
end
