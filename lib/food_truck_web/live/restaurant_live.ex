defmodule FoodTruckWeb.RestaurantLive do
  use FoodTruckWeb, :live_view
  alias FoodTruck.{Repo, Restaurant}
  import Ecto.Query

  def mount(_params, _session, socket) do
    restaurants = from(r in Restaurant, order_by: :name) |> Repo.all()

    socket =
      socket
      |> assign(:restaurants, restaurants)
      |> assign(:images, images())

    {:ok, socket}
  end

  # stock food/restaurant images
  def images do
    [
      "https://media.istockphoto.com/id/1369489882/photo/variety-of-vegan-plant-based-protein-food.jpg?s=612x612&w=is&k=20&c=49K_SXkPRVTiOZMPGJLB_bplC7hAHZuDQv1Z9k4Yww0=",
      "https://media.istockphoto.com/id/1387721011/photo/close-up-of-woman-eating-omega-3-rich-salad.jpg?s=612x612&w=is&k=20&c=W-RcE7BDYmR6rKxwfpC9lxIzYHin7ePrRK8c16khKQM="
    ]
  end
end
