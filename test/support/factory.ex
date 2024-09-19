defmodule FoodTruck.Factory do
  use ExMachina.Ecto, repo: FoodTruck.Repo
  alias FoodTruck.Restaurant

  def restaurant_factory do
    external_location_id = sequence(:external_location_id, &"#{&1}")

    %Restaurant{
      name: "Taco truck",
      address: "123 Main Street, San Francisco",
      location_description: "On the corner",
      food_items: "Tacos",
      schedule_link_url: "http://example.com/schedule",
      longitude: 37.743014249631514,
      latitude: -122.38446024493484,
      external_location_id: external_location_id
    }
  end
end
