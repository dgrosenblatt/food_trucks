defmodule FoodTruck.Repo.Migrations.CreateRestaurants do
  use Ecto.Migration

  def change do
    create table(:restaurants) do
      timestamps()

      add :name, :string, null: false
      add :address, :text, null: false
      add :location_description, :text
      add :food_items, :text
      add :schedule_link_url, :text
      add :latitude, :decimal
      add :longitude, :decimal

      # include as unique id from csv data
      add :external_location_id, :integer, null: false
    end

    unique_index(:restaurants, :external_location_id)
  end
end
