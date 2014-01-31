Code.load_file("dijkstra.ex")
ExUnit.start

defmodule GeomTest do

  use ExUnit.Case, async: true
  doctest Dijkstra

end
