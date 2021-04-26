defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{name: "siri cascudo", email: "siri@gmail.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "siri@gmail.com",
                 "id" => _id,
                 "name" => "siri cascudo"
               }
             } = response
    end

    test "when all params are invalid, returns an error", %{conn: conn} do
      params = %{email: "siri@gmail.com"}

      expected_response = %{"message" => %{"name" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end
end
