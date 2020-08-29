# frozen-string-literal: true

require_relative 'board.rb'

def valid_move?(position)
  if position[0] > 7 || position[0] < 0 || position[1] > 7 || position[1] < 0
    false
  else
    true
  end
end

def possible_moves(position)
  possible_moves_array = []
  possible_moves_array << [position[0] + 1, position[1] + 2]
  possible_moves_array << [position[0] + 1, position[1] - 2]
  possible_moves_array << [position[0] + 2, position[1] + 1]
  possible_moves_array << [position[0] + 2, position[1] - 1]
  possible_moves_array << [position[0] - 2, position[1] + 1]
  possible_moves_array << [position[0] - 2, position[1] - 1]
  possible_moves_array << [position[0] - 1, position[1] + 2]
  possible_moves_array << [position[0] - 1, position[1] - 2]
  possible_moves_array.select { |move| valid_move?(move)}
end

def knight_moves(start_location, end_location)
  unless valid_move?(start_location) && valid_move?(end_location)
    puts 'Please enter valid positions (between 0 and 7) and try again!'
    exit
  end
  path = [start_location]
  frontier = possible_moves(start_location).map { |position| path + [position] }
  loop do
    path = frontier.shift
    break if path[-1] == end_location
    frontier += possible_moves(path[-1]).map { |position| path + [position] }
  end
  puts "You made it in #{path.length - 1} moves! Here's your path:\n"
  p path
  puts ''
  board = Board.new
  path.each_with_index do |position, index|
    board.add_path_indicator(position, index)
  end
  board.display_board
end

empty_board = Board.new
empty_board.display_board
puts ''
print 'Which row is the knight starting at? '
start_row = gets.chomp.to_i
print 'Which column is the knight starting at? '
start_column = gets.chomp.to_i
print 'Which row is the knight going to? '
end_row = gets.chomp.to_i
print 'Which column is the knight going to? '
end_column = gets.chomp.to_i
puts "\n\n"
knight_moves([start_row, start_column],[end_row, end_column])