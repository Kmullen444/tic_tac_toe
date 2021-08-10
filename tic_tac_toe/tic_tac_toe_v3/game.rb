require "./board.rb"
require "./human_player.rb"
require "./computer_player.rb"
class Game

  def initialize(size, players)
    @players = players.map do |mark, player_type|
        if player_type
          Computer_player.new(mark)
        else
          Human_player.new(mark)
        end
        
      end
    @board = Board.new(size)
    @current_player = @players.first
  end

  def switch_turn
    @current_player = @players.rotate!.first
  end

  def play
    while @board.empty_positions?
      @board.print
      puts "#{@current_player.mark} it's your turn"
      current_player_pos = @current_player.get_postition(@board.legal_position)
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