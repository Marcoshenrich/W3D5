require_relative "00_tree_node.rb"

class KnightPathFinder 
    attr_reader :cons_pos

    def initialize(start_pos)
        @start_pos = PolyTreeNode.new(start_pos)
        @cons_pos = [start_pos]
    end

    def self.valid_moves(pos)
        row, col = pos
        valid_move_arr = []
        knight_moves = [[-2, -1],[-2, 1],[-1, -2],[-1, 2],[1, -2],[1, 2],[2, -1],[2, 1]]

        knight_moves.each do |knight_move|
            row1 = row + knight_move[0]
            col1 = col + knight_move[1]
            pos1 = [row1, col1]
            valid_move_arr << pos1 if KnightPathFinder.pos_checker(pos1)
        end
        valid_move_arr
    end

    def new_move_positions(pos)
        validmoves = KnightPathFinder.valid_moves(pos)
        validmoves.select! {|move| !@cons_pos.include?(move) }
        @cons_pos.concat(validmoves)
        validmoves
    end

    def self.pos_checker(pos)
        row, col = pos
        return false if row < 0 || row > 7
        return false if col < 0 || col > 7
        return true
    end

end

#     0     1    2    3    4    5   6    7
# 0 [A, nil, nil, nil, nil, nil, nil, nil],  
# 1 [nil, nil, nil, mov, nil, mov, nil, nil],
# 2 [nil, A2, mov, nil, nil, nil, mov, nil],
# 3 [nil, nil, nil, nil, kgt, nil, nil, nil],
# 4 [nil, nil, mov, nil, nil, nil, mov, nil],
# 5 [nil, nil, nil, mov, nil, mov, nil, nil],
# 6 [nil, nil, nil, nil, nil, nil, nil, nil],
# 7 [nil, nil, nil, nil, nil, nil, nil, B]]

# knight @ 3,4
# moves 
# [1, 3] [-2, -1]
# [1, 5] [-2, +1]
# [2, 2] [-1, -2]
# [2, 6] [-1, +2]
# [4, 2] [+1, -2]
# [4, 6] [+1, +2]
# [5, 3] [+2, -1]
# [5, 5] [+2, +1]
