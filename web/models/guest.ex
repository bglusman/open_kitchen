defmodule OpenKitchen.Guest do
  use OpenKitchen.Web, :model

  schema "guests" do
    field :email, :string
    field :name, :string
    field :phone, :string
    field :ok_to_text, :boolean, default: false
    field :family_members, :integer
    field :kosher, :boolean, default: false
    field :halal, :boolean, default: false
    field :dairy, :boolean, default: false
    field :vegetarian, :boolean, default: false
    field :vegan, :boolean, default: false
    field :allergies, :string
    field :dietary_restriction, :string
    field :location, Geo.Point
    has_many :meal_packages, OpenKitchen.MealPackage, foreign_key: :guest_id
    belongs_to :language, OpenKitchen.Language
    belongs_to :kitchen, OpenKitchen.Kitchen

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :name, :location, :phone, :ok_to_text, :family_members, :kosher, :halal, :dairy, :vegetarian, :vegan, :allergies, :dietary_restriction])
    |> validate_required([:name, :family_members])
  end
end
