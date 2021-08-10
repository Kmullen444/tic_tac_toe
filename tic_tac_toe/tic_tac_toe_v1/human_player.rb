class Human_player
  attr_reader :mark
  def initialize(mark)
    @mark = mark
  end

  def get_postition
    numbers = "1234567890"

    puts "Please enter a row starting at 0"
    row = gets.chomp
    puts "Please enter a what column starting at 0"
    col = gets.chomp
    
    if !numbers.include?(row) || !numbers.include?(col)
      raise "That't not a valid position"
    else
      [row.to_i, col.to_i]
    end
  end

end