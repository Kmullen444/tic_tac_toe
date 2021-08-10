class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(3) { Array.new(3, "-")}
  end

  def valid?(position)
    row_length = @grid.length
    col_length = @grid.first.length

    return false if (row_length < position[0] || col_length < position[1]) || (position[0] < 0 || position[1] < 0)
    true
  end

  def empty?(position)
    pos_row = position[0]
    pos_col = position[1]
    return true if @grid[pos_row][pos_col] == "-"
    false
  end

  def place_mark(position, mark)
    pos_row = position[0]
    pos_col = position[1]

    if !valid?(position) || !empty?(position)
      raise "That's not a valid position"

    else
      @grid[pos_row][pos_col] = mark
    end

  end

  def print
    @grid.each { |row| puts row.join(" ")}
  end

  def win_row?(mark)
    @grid.any? do |row|
      row.all? { |ele| ele == mark}
    end
  end

  def win_col?(mark)
    @grid.transpose.any? do |col|
      col.all? { |ele| ele == mark }
    end
  end

  def win_diagonal?(mark)
    left = []
    right = []
    reversed = @grid.reverse

    (0...@grid.length).each do |i|
      right << @grid[i][i]
      left << reversed[i][i]
    end

    return true if right.all? { |ele| ele == mark }
    return true if left.all? { |ele| ele == mark }
    false
 
  end

  def win?(mark)
    return true if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    false
  end

  def empty_positions?
    @grid.any? { |row| row.include?("-")}
  end

end

b = Board.new
b.print
