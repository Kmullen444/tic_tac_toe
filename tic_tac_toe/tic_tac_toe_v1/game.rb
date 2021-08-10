require "./board.rb"
require "./human_player.rb"
class Game

  def initialize(player_1_mark, player_2_mark)
    @player_1 = Human_player.new(player_1_mark)
    @player_2 = Human_player.new(player_2_mark)
    @board = Board.new
    @current_player = @player_1    
  end

  def switch_turn
    if @current_player == @player_1
      @current_player = @player_2
      puts "#{@current_player.mark} it's your turn"
    else
      @current_player = @player_1
      puts "#{@current_player.mark} it's your turn"
    end
  end

  def play
    while @board.empty_positions?
      @board.print
      current_player_pos = @current_player.get_postition
      @board.place_mark(current_player_pos, @current_player.mark)
      if @board.win?(@current_player.mark)
        @board.print
        return "#{@current_player.mark} You Win!"
      end
      self.switch_turn
    end
    @board.print
    return "It's a draw"
  end

end