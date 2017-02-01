defmodule OpenKitchen.MealComponentController do
  use OpenKitchen.Web, :controller

  alias OpenKitchen.MealComponent

  def index(conn, _params) do
    meal_component = Repo.all(MealComponent)
    render(conn, "index.html", meal_component: meal_component)
  end

  def new(conn, _params) do
    changeset = MealComponent.changeset(%MealComponent{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"meal_component" => meal_component_params}) do
    changeset = MealComponent.changeset(%MealComponent{}, meal_component_params)

    case Repo.insert(changeset) do
      {:ok, _meal_component} ->
        conn
        |> put_flash(:info, "Meal component created successfully.")
        |> redirect(to: meal_component_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    meal_component = Repo.get!(MealComponent, id)
    render(conn, "show.html", meal_component: meal_component)
  end

  def edit(conn, %{"id" => id}) do
    meal_component = Repo.get!(MealComponent, id)
    changeset = MealComponent.changeset(meal_component)
    render(conn, "edit.html", meal_component: meal_component, changeset: changeset)
  end

  def update(conn, %{"id" => id, "meal_component" => meal_component_params}) do
    meal_component = Repo.get!(MealComponent, id)
    changeset = MealComponent.changeset(meal_component, meal_component_params)

    case Repo.update(changeset) do
      {:ok, meal_component} ->
        conn
        |> put_flash(:info, "Meal component updated successfully.")
        |> redirect(to: meal_component_path(conn, :show, meal_component))
      {:error, changeset} ->
        render(conn, "edit.html", meal_component: meal_component, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    meal_component = Repo.get!(MealComponent, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(meal_component)

    conn
    |> put_flash(:info, "Meal component deleted successfully.")
    |> redirect(to: meal_component_path(conn, :index))
  end
end
