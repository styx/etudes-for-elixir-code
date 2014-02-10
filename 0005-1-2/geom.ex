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
    iex(2)> Geom.area({:rectangle, 7, 3})
    21
    iex(3)> Geom.area({:triangle, 7, 3})
    10.5
    iex(4)> Geom.area({:ellipse, 7, 3})
    65.97344572538566
    iex(5)> Geom.area({:pentagon, 7, 3})
    0
    iex(6)> Geom.area(:rectangle, 7, 3)
    ** (UndefinedFunctionError) undefined function: Geom.area/3
  """

  @spec area({ atom, number, number }) :: number
  def area({ shape, a, b }) when a >= 0 and b >= 0 do
    case shape do
      :rectangle -> a * b
      :triangle  -> a * b / 2
      :ellipse   -> :math.pi() * a * b
      _          -> 0
    end
  end

end
