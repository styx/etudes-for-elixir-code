Code.load_file("teeth.ex")
ExUnit.start

defmodule TeethTest do

  use ExUnit.Case, async: true
  doctest Teeth

end
