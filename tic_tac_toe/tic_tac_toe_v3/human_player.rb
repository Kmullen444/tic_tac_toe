class Human_player
  attr_reader :mark
  def initialize(mark)
    @mark = mark
  end

  def get_postition(legal_positions)
    position = []

    until legal_positions.include?(position)
      puts "Please enter a row starting at 0"
      row = gets.chomp
      puts "Please enter a what column starting at 0"
      col = gets.chomp
      position << row.to_i 
      position << col.to_i
      if !legal_positions.include?(position)
        puts "#{position} isn't a valid postition" 
        position = []
      end

    end
    position
  end

end