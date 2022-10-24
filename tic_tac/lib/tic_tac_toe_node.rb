require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.

  def children


    # iterate through the board
    # get all valid positions (if empty)
    # next move mark at every valid position
    # iterate through valid 
    # node.new(validmove)

    valid_pos = []

    @board.each_with_index do |row, i|
      row.each_with_index do |el, z|
        valid_pos << [i,z] if el == nil
      end
    end

    

    valid_pos.each do |pos|
      row, col = pos
      newboard = @board.dup
      newboard[row][col] = @next_mover_mark
      TicTacToeNode.new(newboard, ourmark, pos)
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


  end
  
end
