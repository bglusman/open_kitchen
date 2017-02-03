defmodule OpenKitchen.MealPackage do
  use OpenKitchen.Web, :model

  schema "meal_packages" do
    field :location, :string
    field :servings, :integer
    field :ready, :boolean, default: false
    field :picked_up, :boolean, default: false
    field :expiration, Ecto.DateTime
    belongs_to :guest, OpenKitchen.Guest
    belongs_to :kitchen, OpenKitchen.Kitchen
    has_many :meal_components, OpenKitchen.MealComponent, foreign_key: :meal_package_id
    has_many :supplies, through: [:meal_components, :supply]

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:location, :servings, :ready, :picked_up, :expiration])
    |> validate_required([:location, :servings, :ready, :picked_up, :expiration])
  end
end
