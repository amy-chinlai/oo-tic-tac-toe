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
        [6, 4, 2]
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
         index = input.to_i - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        if @board[index] == "X" || @board[index] == "O"
            true
        else
            false
        end
    end

    def valid_move?(index)
        return true if index.between?(0,8) && position_taken?(index) == false
        # return true if index == /[0-8]/ && position_taken?(index) == false
    end

    def turn_count
        @board.count {|token| token == "X" || token == "O"}
    end    

    def current_player
        if turn_count.even?
            "X"
        else
            "O"
        end
    end

    def turn
        puts "Where would you like to move?"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
            move(index, token = current_player)
            display_board
        else
            turn
        end
    end

    def won?
        if WIN_COMBINATIONS.any? do |combo|
            if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
                return combo
             end
            end 
        end
    end

    def full?
        @board.all? {|token| token == "X" || token == "O"}
    end

    def draw?
        full? && !won?
    end

    def over?
        draw? || won?
    end

    def winner
         @winner = @board[won?.first] if won?
         @winner
    end

    def play
        until over?
            turn
        end
        if draw?
            puts "Cat's Game!"
        else
            puts "Congratulations #{winner}!"
        end
    end


end