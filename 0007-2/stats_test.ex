Code.load_file("stats.ex")
ExUnit.start

defmodule StatsTest do

  use ExUnit.Case, async: true
  doctest Stats

end
