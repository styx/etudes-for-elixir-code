Code.load_file("geom.ex")
ExUnit.start

defmodule GeomTest do

  use ExUnit.Case, async: true
  doctest Geom

  test "accepts Integers" do
    assert Geom.area(3,4) == 12
  end

  test "accepts Floats" do
    assert Geom.area(3.0,4.0) == 12
  end

  test "has defaults" do
    assert Geom.area == 1
  end

  test "has defaults" do
    assert Geom.area(7) == 7
  end

end
