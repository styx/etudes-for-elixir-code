Code.load_file("dates.ex")
ExUnit.start

defmodule DatesTest do

  use ExUnit.Case, async: true
  doctest Dates

end
