Code.load_file("calculus.ex")
ExUnit.start

defmodule CalculusTest do

  use ExUnit.Case, async: true
  doctest Calculus

end
