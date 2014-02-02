Code.load_file("powers.ex")
ExUnit.start

defmodule PowersTest do

  use ExUnit.Case, async: true
  doctest Powers

end
