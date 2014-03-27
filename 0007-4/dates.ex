defmodule Dates do

  @moduledoc """
  Etude: 0007-4
  Describes functions for dates manipulation
  """

  @vsn 0.1


  @doc """
  Calculate julian date from an ISO date string

  iex(2)> Dates.julian("2012-12-31")
  366
  iex(3)> Dates.julian("2013-12-31")
  365
  iex(4)> Dates.julian("2012-02-05")
  36
  iex(5)> Dates.julian("2013-02-05")
  36
  iex(6)> Dates.julian("1900-03-01")
  60
  iex(7)> Dates.julian("2000-03-01")
  61
  iex(126)> Dates.julian("2013-01-01")
  1
  """

  @spec julian(String.t) :: number

  def julian(date_str) do
    [y, m, d] = date_parts(date_str)
    days_per_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    result = month_total(m, days_per_month) + d

    cond do
      leap_year?(y) and m > 2 -> result + 1
      true -> result
    end
  end

  @spec month_total(number, [number]) :: number
  defp month_total(m, days_per_month) do
    { part, _ } = Enum.split(days_per_month, m - 1)
    List.foldl(part, 0, &+/2)
  end

  defp leap_year?(year) do
    (rem(year, 4) == 0 and rem(year, 100) != 0)
    or (rem(year, 400) == 0)
  end


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
