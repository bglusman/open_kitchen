# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     OpenKitchen.Repo.insert!(%OpenKitchen.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

kitchen_params = [
  %{kitchen_name: "Flatbush", max_occupancy: 100, location: %Geo.Point{coordinates: {-73.965288, 40.624061}} },
  %{kitchen_name: "Masbia Pantry", max_occupancy: 20, location: %Geo.Point{coordinates: {-73.995519, 40.632360}} },
  %{kitchen_name: "Queens", max_occupancy: 50, location: %Geo.Point{coordinates: {-73.858008, 40.728167}} }
]

Enum.each(kitchen_params, fn(params) ->
  OpenKitchen.Kitchen.changeset(%OpenKitchen.Kitchen{}, params)
  |> OpenKitchen.Repo.insert!()
end)

guest_params = [
  %{name: "Sue", family_members: 3, location: %Geo.Point{coordinates: {-73.965888, 40.624161}} },
  %{name: "George", family_members: 1, location: %Geo.Point{coordinates: {-73.992519, 40.639260}} },
  %{name: "José", family_members: 1, location: %Geo.Point{coordinates: {-73.858708, 40.728667}} }
]

Enum.each(guest_params, fn(params) ->
  OpenKitchen.Guest.changeset(%OpenKitchen.Guest{}, params)
  |> OpenKitchen.Repo.insert!()
end)
