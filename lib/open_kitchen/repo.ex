defmodule OpenKitchen.Repo do
  use Ecto.Repo, otp_app: :open_kitchen
  use Scrivener, page_size: 10
end
