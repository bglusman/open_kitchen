defmodule OpenKitchen.Supply do
  use OpenKitchen.Web, :model

  schema "supplies" do
    field :name, :string
    field :location, :string
    field :portions, :integer
    field :portion_weight_in_grams, :integer
    field :kosher, :boolean, default: false
    field :halal, :boolean, default: false
    field :dairy, :boolean, default: false
    field :vegetarian, :boolean, default: false
    field :vegan, :boolean, default: false
    field :food_group, FoodGroup
    has_many :meal_components, OpenKitchen.MealComponent, foreign_key: :supply_id
    has_many :meal_packages,through: [:meal_components, :meal_package]
    belongs_to :kitchen, OpenKitchen.Kitchen

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :location, :portions, :portion_weight_in_grams, :kosher, :halal, :dairy, :vegetarian, :vegan, :food_group])
    |> validate_required([:name, :location, :portions, :portion_weight_in_grams, :kosher, :halal, :dairy, :vegetarian, :vegan, :food_group])
  end
end
