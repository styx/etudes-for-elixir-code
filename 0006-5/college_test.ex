Code.load_file("college.ex")
ExUnit.start

defmodule CollegeTest do

  use ExUnit.Case, async: true
  doctest College

end
