class HumanPlayer
    attr_reader :mark

    def initialize(val)
        @mark = val
    end

    def get_position(legal_positions)
        valid = false
        while valid == false 
            puts "Player #{@mark.to_s}, enter two numbers representing a position in the format `row col`. Remember first row or col is 0!"
            pos = gets.chomp.split(' ').map(&:to_i)
            valid = true
            if !legal_positions.include?(pos)
                p 'Sorry, that was invalid position:( Choose again.'
                valid = false
            else 
                return pos
            end
        end
    end
end