defmodule Stats do

  @moduledoc """
  List Comprehensions and Pattern Matching
  """

  @vsn 0.1

  @doc """
  Comprehension that selects the names of all the people who are male or over 40.

  iex(1)> list = [{"Federico", "M", 22}, {"Kim", "F", 45}, {"Hansa", "F", 30}, {"Tran", "M", 47}, {"Cathy", "F", 32}, {"Elias", "M", 50}]
  iex(2)> Stats.comprehension_or(list)
  [{"Federico", "M", 22}, {"Kim", "F", 45}, {"Tran", "M", 47}, {"Elias", "M", 50}]
  """

  @spec comprehension_or(list(tuple)) :: list
  def comprehension_or(list) do
    lc { name, gender, age } inlist list, age > 40 or gender == "M" do
      { name, gender, age }
    end
  end

  @doc """
  Comprehension that selects the names of all the people who are male or over 40.

  iex(1)> list = [{"Federico", "M", 22}, {"Kim", "F", 45}, {"Hansa", "F", 30}, {"Tran", "M", 47}, {"Cathy", "F", 32}, {"Elias", "M", 50}]
  iex(2)> Stats.comprehension_and(list)
  [{"Tran", "M", 47}, {"Elias", "M", 50}]
  """

  @spec comprehension_and(list(tuple)) :: list
  def comprehension_and(list) do
    lc { name, gender, age } inlist list, age > 40, gender == "M" do
      { name, gender, age }
    end
  end

end

