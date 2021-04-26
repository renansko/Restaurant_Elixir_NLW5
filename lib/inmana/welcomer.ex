defmodule Inmana.Welcomer do
  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluete(age)
  end

  defp evaluete(_name, age) when age < 18 do
    {:ok, "acesso negado, menor de idade"}
  end

  defp evaluete("banana", 42) do
    {:error, "Voce eh especial"}
  end

  defp evaluete(name, _age) do
    {:ok, "Welcome #{name}"}
  end
end
