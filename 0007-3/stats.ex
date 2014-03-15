defmodule Stats do

  @docmodule """
  Using lists:foldl/3
  """

  @vsn 0.1

  @doc """
  Mean

  Exapmle:
  iex(2)> Stats.mean([7, 2, 9])
  6.0
  """

  @spec mean(list(number)) :: number
  def mean(list) do
    List.foldl(list, 0, fn(n, acc) -> acc + n end ) / Enum.count(list)
  end


  @doc """
  Stdv

  Example:
  iex(3)> Stats.stdv([7, 2, 9])
  3.60555127546398912486
  """

  @spec stdv(list(number)) :: number
  def stdv(list) do
    n = Enum.count(list)
    sum = List.foldl(list, 0, fn(n, acc) -> acc + n end)
    sum2 = List.foldl(list, 0, fn(n, acc) -> acc + n * n end)

   :math.sqrt((sum2 * n - sum * sum) / (n * (n - 1)))
  end

end

