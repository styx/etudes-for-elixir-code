defmodule Geom do

  @moduledoc """
  Functions for shapes areas
  """
  @vsn 0.1

  @doc "Find out area by width and length"
  @spec area(number // 1, number // 1) :: number
  def area(a, b) do
    a * b
  end

end
