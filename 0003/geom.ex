defmodule Geom do

  @moduledoc """
  Functions for geometric shapes areas.
  """

  @vsn 0.1

  @doc """
  Calculates the area of a rectangle, given the length and width.
  Returns the product of its arguments. The default value for
  both arguments is 1.

  ## Examples
    iex(2)> Geom.area(:rectangle, 3, 4)
    12
    iex(3)> Geom.area(:triangle, 3, 5)
    7.5
    iex(4)> Geom.area(:ellipse, 2, 4)
    25.132741228718345

  """
  @spec area(:atom, number, number) :: number
  def area(:rectangle, a, b) do
    a * b
  end

  def area(:triangle, a, b) do
    a * b / 2
  end

  def area(:ellipse, a, b) do
    :math.pi() * a * b
  end

end
