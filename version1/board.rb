class Board
    def initialize
        @grid = Array.new (3) { Array.new(3, '_') }
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
        return true if (0...@grid.length).all? { |i| @grid[i][i] == mark }

        row = 0
        col = @grid.length - 1
        while row < @grid.length
            if @grid[row][col] == mark
                row += 1
                col -= 1
            else
                return false
            end
            return true
        end
        false
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.any? {|position| position == "_"}
    end

end