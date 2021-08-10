class Computer_player
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end 

  def get_postition(legal_positions)
    row_rand = rand(0...legal_positions.length)
    position = legal_positions[row_rand]
    puts "The computer placed #{@mark} at #{position}"
    position
  end

end