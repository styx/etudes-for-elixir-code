Code.load_file("rand.ex")
ExUnit.start

defmodule RandTest do

  use ExUnit.Case, async: true
  doctest Rand

end
