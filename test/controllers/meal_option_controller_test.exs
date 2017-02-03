defmodule OpenKitchen.MealOptionControllerTest do
  use OpenKitchen.ConnCase

  alias OpenKitchen.MealOption
  @valid_attrs %{description: "some content", food_groups: 42, name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, meal_option_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing meal options"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, meal_option_path(conn, :new)
    assert html_response(conn, 200) =~ "New meal option"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, meal_option_path(conn, :create), meal_option: @valid_attrs
    assert redirected_to(conn) == meal_option_path(conn, :index)
    assert Repo.get_by(MealOption, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, meal_option_path(conn, :create), meal_option: @invalid_attrs
    assert html_response(conn, 200) =~ "New meal option"
  end

  test "shows chosen resource", %{conn: conn} do
    meal_option = Repo.insert! %MealOption{}
    conn = get conn, meal_option_path(conn, :show, meal_option)
    assert html_response(conn, 200) =~ "Show meal option"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, meal_option_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    meal_option = Repo.insert! %MealOption{}
    conn = get conn, meal_option_path(conn, :edit, meal_option)
    assert html_response(conn, 200) =~ "Edit meal option"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    meal_option = Repo.insert! %MealOption{}
    conn = put conn, meal_option_path(conn, :update, meal_option), meal_option: @valid_attrs
    assert redirected_to(conn) == meal_option_path(conn, :show, meal_option)
    assert Repo.get_by(MealOption, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    meal_option = Repo.insert! %MealOption{}
    conn = put conn, meal_option_path(conn, :update, meal_option), meal_option: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit meal option"
  end

  test "deletes chosen resource", %{conn: conn} do
    meal_option = Repo.insert! %MealOption{}
    conn = delete conn, meal_option_path(conn, :delete, meal_option)
    assert redirected_to(conn) == meal_option_path(conn, :index)
    refute Repo.get(MealOption, meal_option.id)
  end
end
