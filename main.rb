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

def clean_move_list(move_list)
  (move_list.length - 1).downto(0) do |i|
    condition1 = (0..7).include? move_list[i][0]
    condition2 = (0..7).include? move_list[i][1]
    move_list.delete_at(i) unless condition1 && condition2
  end
  move_list
end

def possible_move?(start_location, end_location)
  pos_moves = clean_move_list(possible_moves(start_location))
  pos_moves.include? end_location
end

# Shows the simplest possible way to get from one square to another by outputting all squares the knight will stop on along the way
def knight_moves
end




### TESTING
p possible_moves([5, 7])
p possible_moves([5, 7]).length
p clean_move_list(possible_moves([5, 7]))
puts ''
p possible_move?([5, 7], [7, 5])