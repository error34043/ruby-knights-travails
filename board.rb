# frozen-string-literal: true

class String
  def reverse_color;  "\e[7m#{self}\e[27m" end
end

class Board
  attr_reader :WHITE_KNIGHT
  attr_accessor :whole_board

  WHITE_KNIGHT = "\u2658"
  
  def initialize
    row = []
    4.times do
      row << '  '
      row << '  '.reverse_color
    end

    alt_row = []
    4.times do
      alt_row << '  '.reverse_color
      alt_row << '  '
    end

    @whole_board = [
      ['  ', ' 0', ' 1', ' 2', ' 3', ' 4', ' 5', ' 6', ' 7', "\n"],
      ['0 ', *row, "\n"],
      ['1 ', *alt_row, "\n"],
      ['2 ', *row, "\n"],
      ['3 ', *alt_row, "\n"],
      ['4 ', *row, "\n"],
      ['5 ', *alt_row, "\n"],
      ['6 ', *row, "\n"],
      ['7 ', *alt_row, "\n"]
    ]
  end

  def add_path_indicator(move_number, position)
    condition1 = (0..7).include? position[0]
    condition2 = (0..7).include? position[1]
    unless condition1 && condition2
      puts "Invalid input!\n\n"
    else
      outer_index = position[0] + 1
      inner_index = position[1] + 1
      if outer_index % 2 == 1 && inner_index % 2 == 1
        @whole_board[outer_index][inner_index] = "#{move_number}#{WHITE_KNIGHT}"
      else
        @whole_board[outer_index][inner_index] = "#{move_number}#{WHITE_KNIGHT}".reverse_color
      end
    end
  end

  def display_board
    puts @whole_board.join('')
  end
end

=begin
### TESTING
board = Board.new
move_number = 3

# index 0 is for the row and index 1 is for the column
position = [2, 6]

board.add_path_indicator(move_number, position)
board.display_board
=end
