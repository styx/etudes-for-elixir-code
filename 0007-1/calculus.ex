defmodule Calculus do

  @moduledoc """
  Simple Higher Order Functions exercise
  """

  @vsn 0.1

  @doc """

  derivative of a function is "a measure of how a function changes as its input changes"

  Examples:

  iex(2)> f1 = fn(x) -> x * x end
  iex(3)> f1.(7)
  49
  iex(4)> Calculus.derivative(f1, 3)
  6.00000049644222599454

  iex(5)> Calculus.derivative(fn(x) -> 3 * x * x + 2 * x + 1 end, 5)
  32.00000264769187197089

  iex(6)> Calculus.derivative(&:math.sin/1, 0)
  1.0
  """

  @spec derivative(fun, number) :: number
  def derivative(fun, x) do
    delta = 1.0e-10
    (fun.(x + delta) - fun.(x)) / delta
  end

end
