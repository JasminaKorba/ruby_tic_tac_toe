class Board
    def initialize(n)
        @grid = Array.new (n) { Array.new(n, '_') }
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def valid?(position)
        row, col = position
        position.all? do |i|
            i >= 0 && i < @grid.length
        end
    end

    def empty?(position)
        self[position] == "_"
    end

    def place_mark(position, mark)
        raise "Invalid position" if !valid?(position) || !empty?(position)
        self[position] = mark
    end

    def print
        @grid.each do |row|
            puts row.join(' ')
        end
    end

    def win_row?(mark)
        @grid.any? { |row| row.all?(mark) }
    end

    def win_col?(mark)
        @grid.transpose.any? { |col| col.all?(mark) }
    end

    def win_diagonal?(mark)
        left_to_right = (0...@grid.length).all? do |i|
            pos = [i, i]
            self[pos] == mark
        end

        right_to_left = (0...@grid.length).all? do |i|
            row = i
            col = @grid.length - 1 - i
            pos = [row, col]
            self[pos] == mark
        end

        left_to_right || right_to_left
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.any? {|position| position == "_"}
    end

end