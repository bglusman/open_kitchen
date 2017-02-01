defmodule OpenKitchen.MealPackageController do
  use OpenKitchen.Web, :controller

  alias OpenKitchen.MealPackage

  def index(conn, _params) do
    meal_packages = Repo.all(MealPackage)
    render(conn, "index.html", meal_packages: meal_packages)
  end

  def new(conn, _params) do
    changeset = MealPackage.changeset(%MealPackage{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"meal_package" => meal_package_params}) do
    changeset = MealPackage.changeset(%MealPackage{}, meal_package_params)

    case Repo.insert(changeset) do
      {:ok, _meal_package} ->
        conn
        |> put_flash(:info, "Meal package created successfully.")
        |> redirect(to: meal_package_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    meal_package = Repo.get!(MealPackage, id)
    render(conn, "show.html", meal_package: meal_package)
  end

  def edit(conn, %{"id" => id}) do
    meal_package = Repo.get!(MealPackage, id)
    changeset = MealPackage.changeset(meal_package)
    render(conn, "edit.html", meal_package: meal_package, changeset: changeset)
  end

  def update(conn, %{"id" => id, "meal_package" => meal_package_params}) do
    meal_package = Repo.get!(MealPackage, id)
    changeset = MealPackage.changeset(meal_package, meal_package_params)

    case Repo.update(changeset) do
      {:ok, meal_package} ->
        conn
        |> put_flash(:info, "Meal package updated successfully.")
        |> redirect(to: meal_package_path(conn, :show, meal_package))
      {:error, changeset} ->
        render(conn, "edit.html", meal_package: meal_package, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    meal_package = Repo.get!(MealPackage, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(meal_package)

    conn
    |> put_flash(:info, "Meal package deleted successfully.")
    |> redirect(to: meal_package_path(conn, :index))
  end
end
