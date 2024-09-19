# FoodTruck

A sample project app to see where everyone is eating lunch
https://github.com/peck/engineering-assessment

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- San Francisco food trucks from `priv/repo/data/Mobile_Food_Facility_Permit.csv` will be seeded, 
- Seed manually with 

`$ mix run priv/repo/seeds.exs` 

or

`iex(1)> FoodTruck.Setup.Seeder.seed()`
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Deployed with Fly.io, running at: https://food-truck.fly.dev/

Deploy changes with `$fly deploy`


Uses
* LiveView for main page of food trucks with live updates
* PubSub to broadcast where people are eating lunch
* ex_machina for test factories
