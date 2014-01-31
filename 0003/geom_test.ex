Code.load_file("geom.ex")
ExUnit.start

defmodule GeomTest do

  use ExUnit.Case, async: true
  doctest Geom

end
