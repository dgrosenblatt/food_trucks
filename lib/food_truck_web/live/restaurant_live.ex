defmodule FoodTruckWeb.RestaurantLive do
  use FoodTruckWeb, :live_view
  alias FoodTruck.{Repo, Restaurant, Voting}
  alias Phoenix.PubSub
  import Ecto.Query

  def mount(_params, _session, socket) do
    if connected?(socket), do: PubSub.subscribe(FoodTruck.PubSub, "votes")
    restaurants = from(r in Restaurant, order_by: :name) |> Repo.all()

    votes = Voting.value()

    socket =
      socket
      |> assign(:restaurants, restaurants)
      |> assign(:votes, votes)

    {:ok, socket}
  end

  def handle_event("vote", params, socket) do
    Map.get(params, "id")
    |> String.to_integer()
    |> Voting.vote()

    {:noreply, socket}
  end

  def handle_info(:votes_updated, socket) do
    votes = Voting.value()
    socket = socket |> assign(:votes, votes)
    {:noreply, socket}
  end
end
