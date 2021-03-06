defmodule Powers do
  import Kernel, except: [raise: 2, raise: 3]

  @moduledoc """
  Methods to raise integers to the power
  """

  @vsn 0.1

  @doc """
  Allows to raise number x to the npower n

  ## Examples
    iex(2)> Powers.raise(5,1)
    5
    iex(3)> Powers.raise(2,3)
    8
    iex(4)> Powers.raise(1.2, 3)
    1.728
    iex(5)> Powers.raise(2, 0)
    1
    iex(6)> Powers.raise(2, -3)
    0.125
  """

  @spec raise(number, number) :: number
  def raise(_, 0), do: 1
  def raise(x, n) when n < 0, do: 1.0 / raise(x, -n)
  def raise(x, n), do: raise(x, n, 1)

  @spec raise(number, number, number) :: number
  defp raise(_x, 0, acc), do: acc
  defp raise(x, n, acc) do
    raise(x, n - 1, acc * x)
  end

end
