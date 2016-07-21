class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, token)
    @board[index.to_i - 1] = token
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    elsif @board[index] == "X" || @board[index] == "O"
      return true
    end
  end

  def valid_move?(index)
   index.to_i.between?(1,9) && !position_taken?(index.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    index = gets.strip
    if valid_move?(index)
      move(index, token="X")
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |turn|
      if turn == "X" || turn == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
   WIN_COMBINATIONS.select do |win_combination|
      if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
      return win_combination
      end
        if @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
      return win_combination
      end
    end
    return false if @board.empty?
  end

  def full?
   @board.all? do |full_board|
    full_board == "X" || full_board == "O"
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
   WIN_COMBINATIONS.select do |win_combination|
      if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
        return "X"
      end
        if @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
          return "O"
      end
    end
   full?
    return nil
  end

  def play
    until over?
      turn
    end
      won?
      puts "Congratulations X!" if winner == "X"
      puts "Congratulations O!" if winner == "O"
        if draw?
        puts "Cats Game!"
      end
  end
end
