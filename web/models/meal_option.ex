defmodule OpenKitchen.MealOption do
  use OpenKitchen.Web, :model

  schema "meal_options" do
    field :name, :string
    field :description, :string
    field :food_groups, {:array, :food_group}
    # ^could probably be inferred from supplies,
    # but not a proper relation there since arbitrary number of each,
    # represented by number of occurrences of id in consumed_supplies,
    # so, denormalize?
    field :consumed_supplies, {:array, :integer}

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :food_groups])
    |> validate_required([:name, :description, :food_groups])
  end
end
