defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "When the user is special, return a special mensage" do
      params = %{"name" => "banana", "age" => "42"}

      expected_result = {:error, "Voce eh especial"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "When the user is not special, return a mensage" do
      params = %{"name" => "rafael", "age" => "26"}

      expected_result = {:ok, "Welcome rafael"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "When the user is under age, return an error" do
      params = %{"name" => "rafael", "age" => "16"}

      expected_result = {:ok, "acesso negado, menor de idade"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end
