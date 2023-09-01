require_relative "./board.rb" 
require_relative "./human.player.rb" 
class Game
    def initialize(n, *marks)
        @players = marks.map { |mark| HumanPlayer.new(mark) } 
        @board = Board.new(n)
        @current_player = @players.first
    end

    def switch_turn
        @current_player = @players.rotate!.first
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