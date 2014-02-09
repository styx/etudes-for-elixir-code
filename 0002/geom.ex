defmodule Geom do

  @moduledoc """
  Functions for geometric shapes areas.
  """

  @vsn 0.1

  @doc """
  Calculates the area of a rectangle, given the length and width.
  Returns the product of its arguments. The default value for
  both arguments is 1.
  """
  @spec area(number(), number()) :: number()
  def area(a \\ 1, b \\ 1) do
    a * b
  end

end
