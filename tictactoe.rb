class User
    attr_reader :name, :symbol
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end
end



class Board
    attr_reader :display_board
    def initialize
        @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def display_board
        puts <<-HEREDOC

          #{@cells[0]} | #{@cells[1]} | #{@cells[2]}
         ---+---+---
          #{@cells[3]} | #{@cells[4]} | #{@cells[5]}
         ---+---+---
          #{@cells[6]} | #{@cells[7]} | #{@cells[8]}
        
        HEREDOC
    end

    def update_board(number, symbol)
        @cells[number] = symbol
    end
end

class Game
    attr_reader :board, :player1, :player2, :current_player
    def initialize
        @board = Board.new
        @player1 = User.new("Player One", "X")
        @player2 = User.new("Player Two", "O")
        p @current_player = player1
    end

    def display
        board.display_board
    end

    def next_turn
        postion = gets.chomp
    end
end

def begin_game
    puts "Player One you are X"
    puts "Player Two you are O"
    puts "Lets Begin - Player one, choose a position 1-9"
    #symbol = @player1.symbol
    #board.update_board(position, symbol)
end

def play_game
    begin_game
    game = Game.new
    game.display
    game.next_turn
end

play_game