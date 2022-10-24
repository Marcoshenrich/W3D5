require_relative "00_tree_node.rb"

class KnightPathFinder 
    attr_reader :cons_pos, :start_pos

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

    def build_move_tree
        node_queue = [@start_pos]
        until @cons_pos.length == 64
            removed = node_queue.shift
            poss_moves_arr = self.new_move_positions(removed.value)        
            poss_moves_arr.each do |move|
                node = PolyTreeNode.new(move)
                node.parent = removed
                node_queue << node
            end
        end
    end
#  when we initialize knight finder we give it starting pos 
#  that pos = node 
#  what we call on the value of that node is .new_move_positions(pos)
#  return value is all possible locations not visited yet 
#  all elements of that return must become nodes 
#  the source node becomes the parent to those nodes 
#  loop ends when @cons_pos contains 64 elements
#  can call bfs from PolyTree, that we can call on root once that's filled 
    def find_path(end_pos)
        path_arr = []
        end_node = @start_pos.dfs(end_pos)
        until path_arr.first == @start_pos.value
            
            path_arr.unshift(end_node.value)
            end_node = end_node.parent
            
        end
        return path_arr
    end

end

g = KnightPathFinder.new([0, 0])
g.build_move_tree
p g.find_path([7, 6])
p g.find_path([6, 2])


#     0     1    2    3    4    5   6    7
# 0 [A, nil, nil, nil, nil, nil, nil, nil],  
# 1 [nil, nil, A2, mov, nil, mov, nil, nil],
# 2 [nil, A2, mov, A4, nil, nil, mov, nil],
# 3 [nil, nil, nil, nil, kgt, nil, nil, nil],
# 4 [nil, nil, A3, nil, nil, nil, mov, nil],
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


