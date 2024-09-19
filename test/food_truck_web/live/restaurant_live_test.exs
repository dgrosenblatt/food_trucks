defmodule FoodTruckWeb.RestaurantLiveTest do
  use FoodTruckWeb.ConnCase
  import Phoenix.LiveViewTest

  describe "Restaurant Live View" do
    test "shows food trucks", %{conn: conn} do
      restaurant = insert(:restaurant)
      restaurant_2 = insert(:restaurant)

      {:ok, _view, html} = live(conn, "/")
      assert html =~ "<h1>Food Trucks</h1>"

      assert html =~ restaurant.name
      assert html =~ restaurant.food_items
      assert html =~ restaurant.address
      assert html =~ restaurant.location_description

      assert html =~ restaurant_2.name
      assert html =~ restaurant_2.food_items
      assert html =~ restaurant_2.address
      assert html =~ restaurant_2.location_description
    end
  end
end
