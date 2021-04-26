defmodule InmanaWeb.RestaurantsViewTest do
  use InmanaWeb.ConnCase

  import Phoenix.View

  alias Inmana.Restaurant
  alias InmanaWeb.RestaurantsView

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "os noia", email: "siris@si"}
      restaurant = Inmana.create_restaurant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurant created!",
               restaurant:
                 {:ok,
                  %Restaurant{
                    email: "siris@si",
                    id: _id,
                    name: "os noia"
                  }}
             } = response
    end
  end
end
