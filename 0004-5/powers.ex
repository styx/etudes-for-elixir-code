defmodule Powers do
  import Kernel, except: [raise: 2, raise: 3]

  @moduledoc """
  Methods to raise numbers to the power and
  get nubers roots
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

  @doc """
  Get n-th root

  ## Examples
    iex(2)> Powers.nth_root(27, 3)
    3.0
  """
  @spec nth_root(number, number) :: number
  def nth_root(x, n), do: nth_root(x, n, x / 2.0)

  defp nth_root(x, n, a) do
    IO.puts("Current guess is #{a}")
    next = next(x, n, a)
    change = abs(next - a)

    cond do
      change < 1.0e-8 -> next
      true -> nth_root(x, n, next)
    end
  end

  @spec f(number, number, number) :: number
  defp f(x, n, a), do: raise(a, n) - x

  @spec f_prime(number, number) :: number
  defp f_prime(n, a), do: n * raise(a, n - 1)

  @spec f(number, number, number) :: number
  defp next(x, n, a), do: a - f(x, n, a) / f_prime(n, a)

end
