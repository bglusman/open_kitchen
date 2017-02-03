defmodule OpenKitchen.Kitchen do
  use OpenKitchen.Web, :model

  schema "kitchens" do
    field :kitchen_name, :string
    field :location, Geo.Point
    field :max_occupancy, :integer
    field :square_meterage_storage, :float

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:kitchen_name, :location, :max_occupancy, :square_meterage_storage])
    |> validate_required([:kitchen_name, :location, :max_occupancy, :square_meterage_storage])
  end
end
