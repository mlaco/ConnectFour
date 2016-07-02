defmodule ConnectFour.Diagonal3Test do
  use ExUnit.Case
  doctest ConnectFour.Diagonal3
  
  test "#add_items(items, matrix_rem)" do
    items = [3,6,9]
    matrix_rem = [[7],[4,8],[1,5],[2]]
    assert ConnectFour.Diagonal3.add_items(items, matrix_rem) == [[7],[4,8],[1,5,9],[2,6],[3]]
    
    items = [2,5,8]
    matrix_rem = [[7],[4],[1]]
    assert ConnectFour.Diagonal3.add_items(items, matrix_rem) == [[7],[4,8],[1,5],[2]]
  end
  
  test "#add_columns" do
    matrix = [[1,4,7],[2,5,8],[3,6,9]]
    assert ConnectFour.Diagonal3.add_columns(matrix) == [[7],[4,8],[1,5,9],[2,6],[3]]
  end
end
