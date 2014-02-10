defmodule Stats do
  @docmudule """
  Some statistics functions
  """

  @vsn 0.1

  @doc """
  Finds minimum

  Examples:
  iex(2)> data = [4, 1, 7, -17, 8, 2, 5]
  [4,1,7,-17,8,2,5]
  iex(3)> Stats.minimum(data)
  -17
  iex(4)> Stats.minimum([52, 46])
  46
  """

  @spec minimum([number]) :: number
  def minimum([head | tail]) do
    minimum(tail, head)
  end

  @spec minimum([], number) :: number
  def minimum([], min), do: min

  @spec minimum([number], number) :: number
  def minimum([head | tail], min) when head > min, do: minimum(tail, min)

  @spec minimum([number], number) :: number
  def minimum([head | tail], _min), do: minimum(tail, head)


  @doc """
  Finds maximum

  Examples:
  iex(2)> data = [4, 1, 7, -17, 8, 2, 5]
  [4,1,7,-17,8,2,5]
  iex(3)> Stats.maximum(data)
  8
  """

  @spec maximum([number]) :: number
  def maximum([head | tail]) do
    maximum(tail, head)
  end

  @spec maximum([], number) :: number
  def maximum([], max), do: max

  @spec maximum([number], number) :: number
  def maximum([head | tail], max) when head < max, do: maximum(tail, max)

  @spec maximum([number], number) :: number
  def maximum([head | tail], _max), do: maximum(tail, head)


  @doc """
  #range/1, which takes a list of numbers as its argument and returns a
  list containing the maximum and minimum values in the list.

  Example:
  iex(2)> data = [4, 1, 7, -17, 8, 2, 5]
  [4,1,7,-17,8,2,5]
  iex(6)> Stats.range(data)
  [-17,8]
  """

  @spec range([number]) :: [number]
  def range(list) do
    [minimum(list), maximum(list)]
  end

end
