defmodule AskArea do

  @moduledoc """
  Allows to enter area type
  """

  @vsn 0.1

  @doc """
  Asks for area type and dimensions,
  returns
  """

  @spec area :: number
  def area do
    type_char = IO.gets("R)ectangle, T)riangle, or E)llipse: ") |> String.first
    shape = char_to_shape(type_char)
    { p1, p2 } = case shape do
      :rectangle -> get_dimensions("width", "height")
      :triangle  -> get_dimensions("base",  "height")
      :ellipse   -> get_dimensions("width", "height")
      :unknown   -> { type_char, 0 }
    end
    calculate(shape, p1, p2)
  end

  @spec char_to_shape(String.t) :: atom
  defp char_to_shape(char) do
    case String.downcase(char) do
      "r" -> :rectangle
      "t" -> :triangle
      "e" -> :ellipse
      _   -> :unknown
    end
  end

  @spec get_number(String.t) :: integer
  defp get_number(prompt) do
    potential_number =
      IO.gets("Enter #{prompt} > ")
      |> String.strip
    cond do
      Regex.match?(%r/^[+-]?\d+$/, potential_number) -> binary_to_integer(potential_number)
      Regex.match?(%r/^[+-]?\d+\.\d+([eE][+-]?\d+)?$/, potential_number) -> binary_to_float(potential_number)
      true -> :error
    end

  end

  @spec get_dimensions(String.t, String.t) :: { integer, integer }
  defp get_dimensions(p1, p2) do
    { get_number(p1), get_number(p2) }
  end

  @spec calculate(atom, integer, integer) :: number
  def calculate(shape, p1, _p2) when shape == :unknown, do: "Unknown shape #{p1}"
  def calculate(_shape, p1, p2) when p1 < 0 or p2 < 0, do: "Both numbers must be greater than or equal to zero."
  def calculate(_shape, p1, p2) when p1 == :error or p2 == :error, do: "Invalid input"
  def calculate(shape, p1, p2) do
    Geom.area({ shape, p1, p2 })
  end

end
