require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_mov_pos, :children
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @children = []
    # self.children_maker
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.

  def children_maker


    # iterate through the board
    # get all valid positions (if empty)
    # next move mark at every valid position
    # iterate through valid 
    # node.new(validmove)

    valid_pos = []

    @board.rows.each_with_index do |row, i|
      row.each_with_index do |el, z|
        valid_pos << [i,z] if el == nil
      end
    end
    
    ourmark = @next_mover_mark == :x ? :o : :x
    
    valid_pos.each do |pos|
      row, col = pos
      newboard = @board.rows.map(&:clone)
      newboard[row][col] = @next_mover_mark
      @children << TicTacToeNode.new(Board.new(newboard), ourmark, pos)
      # @children.each do |child|
      #   child.child_maker
      # end
    end
  end
  
end

# curret node
    # [nil,:X:,nil]
    # [nil,nil,nil]
    # [nil,nil,nil]


    #-> 

    #child 1
    # [:0,:X:,nil]
    # [nil,nil,nil]
    # [nil,nil,nil]

    #child 2
    # [nil,:X:,:0]
    # [nil,nil,nil]
    # [nil,nil,nil]