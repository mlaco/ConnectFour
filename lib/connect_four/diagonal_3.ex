defmodule ConnectFour.Diagonal3 do
  def add_columns(rows) do
    [next_row | rem_rows] = rows
    add_columns(next_row, rem_rows, [])
  end
  
  def add_columns(row, [], acc) do
    add_items(List.flatten(row), acc)
  end
  
  def add_columns(row, rem_rows, []) do
    [next_row | rem_rows] = rem_rows
    add_columns(next_row, rem_rows, Enum.reverse(row))
  end
  
  def add_columns(row, rem_rows, acc) do
    [next_row | next_rem_rows] = rem_rows
    new_acc = add_items(List.flatten(row), acc)
    add_columns(next_row, next_rem_rows, new_acc)
  end
  
  @doc """
  Given a column from an original matrix, place each item from
  that column into the target matrix, in which each row contains
  the items from the diagonals of the original matrix.
  
  ## Parameters
  
    item - Integer; the next item to add. Taken from the end of rem_items
    items - Array; column from original matrix to insert, must not be empty
    rem_items - Array; the remaining items from a column of the original matrix
    acc - Array; target matrix in construction
    rem_matrix - Array; target matrix before calling add_items
    range - Array; [1, n - 1] where n is the size of the columns of the original
      matrix
  """
  def add_items(items, orig_matrix) do
    [item | rem_items] = Enum.reverse(items)
    range = [1, Enum.count(items) - 1]
    
    add_items(item, rem_items, [], orig_matrix, range)
  end
  
  def add_items(item, rem_items, [], rem_matrix, range) do
    [acc_item | next_rem_matrix] = rem_matrix
    acc = [acc_item]
    
    add_items(item, rem_items, acc, next_rem_matrix, range)
  end
  
  def add_items(item, [], acc, _, _) do
    insert_at_end(acc, [item])
  end
  
  def add_items(item, rem_items, acc, rem_matrix, range) do
    [next_rem_matrix_row | next_rem_matrix] = rem_matrix
    cond do
      Enum.count(rem_matrix) >= Enum.min(range) &&
      Enum.count(rem_matrix) <= Enum.max(range) ->
        [next_item | next_rem_items] = rem_items
        new_row = insert_at_end(next_rem_matrix_row, item)
        new_acc = insert_at_end(acc, new_row)
        
        add_items(next_item, next_rem_items, new_acc, next_rem_matrix, range)
      true ->
        new_acc = insert_at_end(acc, next_rem_matrix_row)
        
        add_items(item, rem_items, new_acc, next_rem_matrix, range)
    end
  end
  
  def insert_at_end(list, item) do
    Enum.reverse(list)
    |> Enum.into([item])
    |> Enum.reverse
  end
end
