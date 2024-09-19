defmodule FoodTruck.Setup.Seeder do
  @moduledoc """
  Functions for seeding food truck data from CSV
  Filters out food trucks with permits that are not approved
  """
  alias FoodTruck.{Repo, Restaurant}

  @csv_path "../../../priv/repo/data/Mobile_Food_Facility_Permit.csv"

  def seed do
    @csv_path
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> CSV.decode!(headers: true)
    |> Enum.map(&__MODULE__.save(&1))
  end

  def save(restaurant = %{"Status" => "APPROVED"}) do
    %{
      "Applicant" => name,
      "Address" => address,
      "LocationDescription" => location_description,
      "FoodItems" => food_items,
      "Schedule" => schedule_link_url,
      "Latitude" => latitude,
      "Longitude" => longitude,
      "locationid" => external_location_id
    } = restaurant

    params = %{
      name: name,
      address: address,
      location_description: location_description,
      food_items: food_items,
      schedule_link_url: schedule_link_url,
      latitude: latitude,
      longitude: longitude,
      external_location_id: external_location_id
    }

    # update existing row if already exists
    # allow repeated runs without duplicating data
    case Repo.get_by(Restaurant, external_location_id: external_location_id) do
      nil -> %Restaurant{external_location_id: external_location_id}
      restaurant -> restaurant
    end
    |> Restaurant.changeset(params)
    |> FoodTruck.Repo.insert_or_update()
  end

  # Skip food trucks with unapproved permits
  def save(%{"Status" => _}), do: {:ok, :skipped}
end
