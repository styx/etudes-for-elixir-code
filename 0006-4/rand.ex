defmodule Rand do

  @moduledoc """
  Generates random sequences
  """

  @vsn 0.1

  @doc """
  Generates teeth pockets

  Example:

  iex(1)> Rand.generate_pockets('TFTTTTFT', 0.5)
  [[3, 2, 1, 2, 3, 3], [0], [2, 4, 2, 2, 3, 3], [3, 3, 2, 3, 3, 2],
   [1, 1, 3, 2, 1, 1], [1, 1, 3, 3, 3, 1], [0], [3, 4, 2, 2, 2, 2]]

  """

  @spec generate_pockets([char], number) :: [[integer]]
  def generate_pockets(teeth_list, probability) do
    generate_pockets(teeth_list, probability, [])
  end


  @spec generate_pockets([char], number, []) :: [[integer]]
  def generate_pockets([], _probability, result), do: Enum.reverse(result)

  def generate_pockets([?T | left_teeth], probability, result) do
    generate_pockets(left_teeth, probability, [generate_tooth(probability) | result])
  end

  def generate_pockets([?F | left_teeth], probability, result) do
    generate_pockets(left_teeth, probability, [[0] | result])
  end


  @doc """
  Generates a list of 6 depths for a tooth

  Examples:
  iex(1)> :random.seed({1,2,3})
  :undefined
  iex(2)> Rand.generate_tooth(0.5)
  [1, 1, 2, 3, 1, 3]

  iex(3)> :random.seed({7,7,7})
  :undefined
  iex(4)> Rand.generate_tooth(0.1)
  [3, 3, 2, 3, 4, 2]
  """

  @spec generate_tooth(number) :: [integer]
  def generate_tooth(probability) do
    cond do
      :random.uniform() < probability -> base = 2
      true -> base = 3
    end

    generate_tooth(base, 6, [])
  end

  @spec generate_tooth(integer, integer, [integer]) :: [integer]
  def generate_tooth(_base, 0, result), do: result

  def generate_tooth(base, count, result) do
    new_val = base + :random.uniform(3) - 2
    generate_tooth(base, count - 1, [new_val | result])
  end

end
