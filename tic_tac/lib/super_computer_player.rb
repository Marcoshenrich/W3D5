require_relative 'tic_tac_toe_node'
require "byebug"

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    debugger
    startnode = TicTacToeNode.new(game, mark)
    startnode.children
    
    startnode.childrens.each do |child|
      return child.prev_move_pos if child.winning_node?(mark)
    end

    startnode.childrens.each do |child|
      return child.prev_move_pos unless child.losing_node?(mark)
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
