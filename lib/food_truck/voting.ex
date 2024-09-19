defmodule FoodTruck.Voting do
  @moduledoc """
  A store for keeping track of how many people ate at each restaurant
  Indexed by %{ restaurant_id => number_of_people }
  """
  use Agent
  alias Phoenix.PubSub

  def start_link(initial_value) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def value do
    Agent.get(__MODULE__, & &1)
  end

  def vote(restaurant_id) do
    response =
      Agent.update(__MODULE__, fn state ->
        next_count =
          case Map.get(state, restaurant_id) do
            nil -> 1
            val -> val + 1
          end

        Map.put(state, restaurant_id, next_count)
      end)

    PubSub.broadcast(FoodTruck.PubSub, "votes", :votes_updated)

    response
  end
end
