defmodule OpenKitchen.MealOptionController do
  use OpenKitchen.Web, :controller

  alias OpenKitchen.MealOption

  def index(conn, _params) do
    meal_options = Repo.all(MealOption)
    render(conn, "index.html", meal_options: meal_options)
  end

  def new(conn, _params) do
    changeset = MealOption.changeset(%MealOption{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"meal_option" => meal_option_params}) do
    changeset = MealOption.changeset(%MealOption{}, meal_option_params)

    case Repo.insert(changeset) do
      {:ok, _meal_option} ->
        conn
        |> put_flash(:info, "Meal option created successfully.")
        |> redirect(to: meal_option_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    meal_option = Repo.get!(MealOption, id)
    render(conn, "show.html", meal_option: meal_option)
  end

  def edit(conn, %{"id" => id}) do
    meal_option = Repo.get!(MealOption, id)
    changeset = MealOption.changeset(meal_option)
    render(conn, "edit.html", meal_option: meal_option, changeset: changeset)
  end

  def update(conn, %{"id" => id, "meal_option" => meal_option_params}) do
    meal_option = Repo.get!(MealOption, id)
    changeset = MealOption.changeset(meal_option, meal_option_params)

    case Repo.update(changeset) do
      {:ok, meal_option} ->
        conn
        |> put_flash(:info, "Meal option updated successfully.")
        |> redirect(to: meal_option_path(conn, :show, meal_option))
      {:error, changeset} ->
        render(conn, "edit.html", meal_option: meal_option, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    meal_option = Repo.get!(MealOption, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(meal_option)

    conn
    |> put_flash(:info, "Meal option deleted successfully.")
    |> redirect(to: meal_option_path(conn, :index))
  end
end
