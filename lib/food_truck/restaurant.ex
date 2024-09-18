defmodule FoodTruck.Restaurant do
  @moduledoc """
  Food trucks in the San Francisco area
  Seeded from: https://data.sfgov.org/Economy-and-Community/Mobile-Food-Facility-Permit/rqzj-sfat/data
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "restaurants" do
    field :name, :string
    field :address, :string
    field :location_description, :string
    field :food_items, :string
    field :schedule_link_url, :string
    field :latitude, :decimal
    field :longitude, :decimal
    field :external_location_id, :integer

    timestamps(type: :utc_datetime)
  end

  def changeset(restaurant, attrs) do
    restaurant
    |> cast(attrs, [
      :name,
      :address,
      :location_description,
      :food_items,
      :schedule_link_url,
      :latitude,
      :longitude,
      :external_location_id
    ])
    |> validate_required([:name, :address, :external_location_id])
  end
end
