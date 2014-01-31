defmodule Dijkstra do

  @moduledoc """
  Methods devised by Edsger W. Dijkstra
  """

  @vsn 0.1

  @doc """
  Finds the GCD of integers M and N:
    If M and N are equal, the result is M.
    If M is greater than N, the result is the GCD of M - N and N
    Otherwise M must be less than N, and the result is the GCD of M and N - M.

  ## Examples
    iex(2)> Dijkstra.gcd(2, 8)
    2
    iex(3)> Dijkstra.gcd(14, 21)
    7
    iex(4)> Dijkstra.gcd(125, 46)
    1
    iex(5)> Dijkstra.gcd(120, 36)
    12
  """

  @spec gcd(integer, integer) :: integer
  def gcd(m, n) when m == n, do: m
  def gcd(m, n) when m > n,  do: gcd(m - n, n)
  def gcd(m, n),             do: gcd(m, n - m)

end
