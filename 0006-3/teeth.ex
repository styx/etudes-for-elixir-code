defmodule Teeth do

  @moduledoc """
  Dentists check the health of your gums by checking the depth of the
  "pockets" at six different locations around each of your 32 teeth.
  The depth is measured in millimeters. If any of the depths is greater
  than or equal to four millimeters, that tooth needs attention.
  (Thanks to Dr. Patricia Lee, DDS, for explaining this to me.)
  """

  @vsn 0.1


  def pocket_depths do
    [[0], [2,2,1,2,2,1], [3,1,2,3,2,3],
    [3,1,3,2,1,2], [3,2,3,2,2,1], [2,3,1,2,1,1],
    [3,1,3,2,3,2], [3,3,2,1,3,1], [4,3,3,2,3,3],
    [3,1,1,3,2,2], [4,3,4,3,2,3], [2,3,1,3,2,2],
    [1,2,1,1,3,2], [1,2,2,3,2,3], [1,3,2,1,3,3], [0],
    [3,2,3,1,1,2], [2,2,1,1,3,2], [2,1,1,1,1,2],
    [3,3,2,1,1,3], [3,1,3,2,3,2], [3,3,1,2,3,3],
    [1,2,2,3,3,3], [2,2,3,2,3,3], [2,2,2,4,3,4],
    [3,4,3,3,3,4], [1,1,2,3,1,2], [2,2,3,2,1,3],
    [3,4,2,4,4,3], [3,3,2,1,2,3], [2,2,2,2,3,3],
    [3,2,3,2,3,2]]
  end

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
  Find out problems in teeth

  Examples:
  iex(2)> Teeth.alert(Teeth.pocket_depths())
  [9,11,25,26,29]
  """

  # Non-tail variant
  #@spec alert([[number]]) :: [number]
  #def alert(list) do
    #alert(list, 1)
  #end

  #def alert([], _current), do: []
  #def alert([head | tails], current) do
    #cond do
      #maximum(head) > 3 -> [current | alert(tails, current + 1)]
      #true              -> alert(tails, current + 1)
    #end
  #end

  @spec alert([[number]]) :: [number]
  def alert(list) do
    alert(list, 1, []) |> Enum.reverse
  end

  def alert([], _current, result), do: result
  def alert([head | tail], current, result) do
    cond do
      maximum(head) > 3 -> alert(tail, current + 1, [current | result])
      true              -> alert(tail, current + 1, result)
    end
  end
end
