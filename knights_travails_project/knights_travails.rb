require_relative "tree_node_project/lib/00_tree_node.rb"

class KnightPathFinder 
    def initialize(start_pos)
        @start_pos = PolyTreeNode.new(start_pos)
        @cons_pos = [start_pos]
    end

    def self.valid_move(pos)
        row, col = pos
        valid_move_arr = []
        valid_move_arr << [row - 2, col - 1] if KnightPathFinder.pos_checker([row - 2, col - 1])
        knight_moves = [[-2, -1]
        [-2, +1]
        [-1, -2]
        [-1, +2]
        [+2, -1]
        [+1, +2]
        [+2, -1]
        [+2, +1]]
    end

    def new_move_positions(pos)
    end

    def self.pos_checker(pos)
        row, col = pos
        return false if row < 0 || row > 7
        return false if col < 0 || col > 7
        return true
    end

end

#     0     1    2    3    4    5   6    7
# 0 [[nil, nil, nil, nil, nil, nil, nil, nil],  
# 1 [nil, nil, nil, mov, nil, mov, nil, nil],
# 2 [nil, nil, mov, nil, nil, nil, mov, nil],
# 3 [nil, nil, nil, nil, kgt, nil, nil, nil],
# 4 [nil, nil, mov, nil, nil, nil, mov, nil],
# 5 [nil, nil, nil, mov, nil, mov, nil, nil],
# 6 [nil, nil, nil, nil, nil, nil, nil, nil],
# 7 [nil, nil, nil, nil, nil, nil, nil, nil]]

# knight @ 3,4
# moves 
# [1, 3] [-2, -1]
# [1, 5] [-2, +1]
# [2, 2] [-1, -2]
# [2, 6] [-1, +2]
# [4, 2] [+2, -1]
# [4, 6] [+1, +2]
# [5, 3] [+2, -1]
# [5, 5] [+2, +1]