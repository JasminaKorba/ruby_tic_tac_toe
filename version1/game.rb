require_relative "./board.rb" 
require_relative "./human.player.rb" 
class Game
    def initialize(mark_1, mark_2)
        @player_1 = HumanPlayer.new(mark_1)
        @player_2 = HumanPlayer.new(mark_2)
        @board = Board.new
        @current_player = @player_1 
    end

    def switch_turn
        @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "Game Over!"
                puts "Player #{@current_player.mark.to_s} has won!"
                return
            else
                switch_turn
            end
        end

        p "No more empty position. Game over!"
    end

end