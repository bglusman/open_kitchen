defmodule OpenKitchen.MealSelectionController do
  use OpenKitchen.Web, :controller

  alias OpenKitchen.MealSelection

  def index(conn, _params) do
    meal_selections = Repo.all(MealSelection)
    render(conn, "index.html", meal_selections: meal_selections)
  end

  def new(conn, _params) do
    changeset = MealSelection.changeset(%MealSelection{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"meal_selection" => meal_selection_params}) do
    changeset = MealSelection.changeset(%MealSelection{}, meal_selection_params)

    case Repo.insert(changeset) do
      {:ok, _meal_selection} ->
        conn
        |> put_flash(:info, "Meal selection created successfully.")
        |> redirect(to: meal_selection_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    meal_selection = Repo.get!(MealSelection, id)
    render(conn, "show.html", meal_selection: meal_selection)
  end

  def edit(conn, %{"id" => id}) do
    meal_selection = Repo.get!(MealSelection, id)
    changeset = MealSelection.changeset(meal_selection)
    render(conn, "edit.html", meal_selection: meal_selection, changeset: changeset)
  end

  def update(conn, %{"id" => id, "meal_selection" => meal_selection_params}) do
    meal_selection = Repo.get!(MealSelection, id)
    changeset = MealSelection.changeset(meal_selection, meal_selection_params)

    case Repo.update(changeset) do
      {:ok, meal_selection} ->
        conn
        |> put_flash(:info, "Meal selection updated successfully.")
        |> redirect(to: meal_selection_path(conn, :show, meal_selection))
      {:error, changeset} ->
        render(conn, "edit.html", meal_selection: meal_selection, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    meal_selection = Repo.get!(MealSelection, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(meal_selection)

    conn
    |> put_flash(:info, "Meal selection deleted successfully.")
    |> redirect(to: meal_selection_path(conn, :index))
  end
end
