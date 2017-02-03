defmodule OpenKitchen.KitchenController do
  use OpenKitchen.Web, :controller

  alias OpenKitchen.Kitchen

  def index(conn, _params) do
    kitchens = Repo.all(Kitchen)
    render(conn, "index.html", kitchens: kitchens)
  end

  def new(conn, _params) do
    changeset = Kitchen.changeset(%Kitchen{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"kitchen" => kitchen_params}) do
    changeset = Kitchen.changeset(%Kitchen{}, kitchen_params)

    case Repo.insert(changeset) do
      {:ok, _kitchen} ->
        conn
        |> put_flash(:info, "Kitchen created successfully.")
        |> redirect(to: kitchen_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    kitchen = Repo.get!(Kitchen, id)
    render(conn, "show.html", kitchen: kitchen)
  end

  def edit(conn, %{"id" => id}) do
    kitchen = Repo.get!(Kitchen, id)
    changeset = Kitchen.changeset(kitchen)
    render(conn, "edit.html", kitchen: kitchen, changeset: changeset)
  end

  def update(conn, %{"id" => id, "kitchen" => kitchen_params}) do
    kitchen = Repo.get!(Kitchen, id)
    changeset = Kitchen.changeset(kitchen, kitchen_params)

    case Repo.update(changeset) do
      {:ok, kitchen} ->
        conn
        |> put_flash(:info, "Kitchen updated successfully.")
        |> redirect(to: kitchen_path(conn, :show, kitchen))
      {:error, changeset} ->
        render(conn, "edit.html", kitchen: kitchen, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    kitchen = Repo.get!(Kitchen, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(kitchen)

    conn
    |> put_flash(:info, "Kitchen deleted successfully.")
    |> redirect(to: kitchen_path(conn, :index))
  end
end
