defmodule Dates do

  @moduledoc """
  Describes functions for dates manipulation
  """

  @vsn 0.1

  @doc """

  Parses date in ISO format

  Examples
  iex(2)> Dates.date_parts("2013-06-15")
  [2013,6,15]
  """

  @spec date_parts(String.t) :: list
  def date_parts(date) do
    String.split(date, "-") |> Enum.map &(&1 |> binary_to_integer)
  end

end
