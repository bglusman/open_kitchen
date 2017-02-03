defmodule OpenKitchen.Language do
  use OpenKitchen.Web, :model

  schema "languages" do
    field :iso_code, :string
    field :english_name, :string
    field :native_name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:iso_code, :english_name, :native_name])
    |> validate_required([:iso_code, :english_name, :native_name])
  end
end
