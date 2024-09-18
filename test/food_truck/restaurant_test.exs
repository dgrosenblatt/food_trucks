defmodule FoodTruck.RestaurantTest do
  use FoodTruck.DataCase
  alias FoodTruck.Restaurant

  describe "changeset/2" do
    test "is valid with required params" do
      params = %{
        name: "Taco truck",
        address: "123 Main Street, San Francisco",
        location_description: "On the corner",
        food_items: "Tacos",
        days_hours: "M-F, 11AM-7PM",
        longitude: 37.743014249631514,
        latitude: -122.38446024493484,
        external_location_id: 1
      }

      changeset = Restaurant.changeset(%Restaurant{}, params)

      assert changeset.valid? == true
    end

    test "is invalid when missing required params" do
      params = %{}

      changeset = Restaurant.changeset(%Restaurant{}, params)

      assert changeset.valid? == false

      assert changeset.errors == [
               name: {"can't be blank", [validation: :required]},
               address: {"can't be blank", [validation: :required]},
               external_location_id: {"can't be blank", [validation: :required]}
             ]
    end
  end
end
