### wip, was practicing object orienrted programming and
### wanted to make and automated tic-tac-toe game
### that runs through a game between two users
### need to test a little more, adding specs soon

class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new(Array.new())
  end

  def start
    until @board.status
      @player1.selection(@board)
      @player2.selection(@board)
    end
  end
end

class Player
  def initialize(name, letter)
    @name = name
    @letter = letter
  end

  def selection(board)
    finish = board.matrix.each_with_index.select {|x, i| x.include? ""}.map {|y|y.last}.max
    choice = [(0..finish).to_a.sample, (0..finish).to_a.sample]
    board.update(@name, choice) unless !board.valid_move(choice)
  end
end

class Board
  attr_accessor :matrix

  def initialize(matrix)
    @matrix = matrix
    create_board
  end

  def create_board
    1.upto(3) do
      start = []
      1.upto(3) { start << "" }
      @matrix << start
    end
  end

  def valid_move(selection)
    @matrix[selection.first][selection.last].empty?
  end

  def update(player, selection)
    @matrix[selection.first][selection.last] = player
  end

  def status
    check_rows? || check_other?
  end

  private

  def check_rows?
    rows = @matrix.select{|elm| !elm.include? ""}
    validate_row(rows)
  end

  def check_other?
    left = validate_row([@matrix[0][0], @matrix[1][0], @matrix[2][0]])
    middle = validate_row([@matrix[0][1], @matrix[1][1], @matrix[2][1]])
    right = validate_row([@matrix[0][2], @matrix[1][2], @matrix[2][2]])
    left_angle = validate_row([@matrix[0][0], @matrix[1][0], @matrix[2][2]])
    right_angle = validate_row([@matrix[0][2], @matrix[1][0], @matrix[2][0]])
    left || middle || right || left_angle || right_angle
  end

  def validate_row(rows)
    row_check = rows.select{|elm| elm.uniq.length == 1}
    !row_check.empty?
  end
end

game1 = Game.new(Player.new("Kaz", "X"), Player.new("Borisevich", "Y"))
game1.start
