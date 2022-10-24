require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos, :childrens
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @childrens = []
  end

  def losing_node?(evaluator)
    other_mark = evaluator == :x ? :o : :x
    
    self.children
    return true if self.board.winner == other_mark
    return false if self.board.over?
    
    childrens.each do |child|
      return true if child.board.winner == other_mark
    end 

    return true if childrens.all? { |child| child.losing_node?(evaluator)}
 
    false
  end

  def winning_node?(evaluator)
    other_mark = evaluator == :x ? :o : :x

    self.children
    return true if self.board.winner == evaluator
    return false if self.board.over?
    
    childrens.each do |child|
      return true if child.board.winner == evaluator
    end 

    return true if childrens.all? { |child| child.winning_node?(evaluator)}
 
    false


  end

  # This method generates an array of all moves that can be made after
  # the current move.

  def children


    next_mark = self.next_mover_mark == :x ? :o : :x
    
    (0..2).each do |i|
      (0..2).each do |z|
        
        pos = [i, z]
        
        if newboard[pos] == nil
          newboard = board.dup
          newboard[pos] = self.next_mover_mark
          self.childrens << TicTacToeNode.new(newboard, next_mark, pos)
        end
      end
    end
    self.childrens

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