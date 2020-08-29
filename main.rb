# frozen-string-literal: true

require_relative 'board.rb'

def possible_moves(position)
  possible_moves_array = []
  possible_moves_array << [position[0] + 2, position[1] + 1]
  possible_moves_array << [position[0] + 2, position[1] - 1]
  possible_moves_array << [position[0] + 1, position[1] + 2]
  possible_moves_array << [position[0] + 1, position[1] - 2]
  possible_moves_array << [position[0] - 2, position[1] + 1]
  possible_moves_array << [position[0] - 2, position[1] - 1]
  possible_moves_array << [position[0] - 1, position[1] + 2]
  possible_moves_array << [position[0] - 1, position[1] - 2]
  possible_moves_array
end

# Shows the simplest possible way to get from one square to another by outputting all squares the knight will stop on along the way
def knight_moves
end
