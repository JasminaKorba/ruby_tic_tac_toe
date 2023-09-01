class ComputerPlayer
    attr_reader :mark

    def initialize(val)
        @mark = val
    end

    def get_position(legal_positions)
        random = legal_positions.sample(1)
        puts "Computer player #{@mark.to_s} has selected #{random}."
        random.flatten
    end
end