require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos, :childrens
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @childrens = []
    # self.children_maker
  end

  def losing_node?(evaluator)
    other_mark = evaluator == :x ? :o : :x
    # return true if self.board.winner == other_mark
    self.children
    return true if self.board.winner == other_mark
    
    childrens.each do |child|
      return true if child.board.winner == other_mark
    end 
    # count = 0 
    # childrens.each do |child|
    #   count += 1 if child.losing_node?(evaluator)
    # end
    # return true if count == childrens.length
    false
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.

  def children


    next_mark = self.next_mover_mark == :x ? :o : :x
    
    (0..2).each do |i|
      (0..2).each do |z|
        
        pos = [i,z]
        
        if @board.empty?(pos)
          newboard = board.dup
          newboard[pos] = self.next_mover_mark
          @childrens << TicTacToeNode.new(newboard, next_mark, pos)
        end
      end
    end
    @childrens

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