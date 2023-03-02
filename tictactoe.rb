class User
    attr_reader :name, :symbol
    attr_accessor :selections
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
        @selections = Array.new
    end
end



class Board
   attr_reader :cells
    def initialize
        @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def display_board
        puts <<-HEREDOC

          #{cells[0]} | #{cells[1]} | #{cells[2]}
         ---+---+---
          #{cells[3]} | #{cells[4]} | #{cells[5]}
         ---+---+---
          #{cells[6]} | #{cells[7]} | #{cells[8]}
        
        HEREDOC
    end

    def update_board(number, symbol)
        cells[number - 1] = symbol
    end
    def full?
        cells.all? { |cell| cell =~ /[^0-9]/ }
      end
end

class Game
    attr_reader :board, :player1, :player2, :current_player

    def initialize
        @board = Board.new
        @player1 = User.new("Player One", "X")
        @player2 = User.new("Player Two", "O")
        @current_player = nil
    end

    def display
        board.display_board
    end

    def player_turns
        @current_player = player1
        until board.full?
            next_turn
            break if self.game_over?
           @current_player = switch_current_player
        end
    end

    def next_turn
        position = gets.chomp
        current_player.selections.push position
        current_player.selections
        board.update_board(position.to_i, current_player.symbol)
        self.display
    end
    def switch_current_player
        if current_player == player1
          player2
        else
          player1
        end
    end
    def game_over?
        winning_combo = [
            ["1","2","3"],
            ["4","5","6"],
            ["7","8","9"],
            ["1","4","7"],
            ["2","5","8"],
            ["3","6","9"],
            ["1","5","9"],
            ["3","5","7"]
        ]
        winning_combo.any? do |combo|
             current_player.selections
             a = combo.intersection(current_player.selections)
             a == combo 
        end
    end
end

def begin_game
    puts "Player One you are X"
    puts "Player Two you are O"
    puts "Lets Begin - Player one, choose a position 1-9"
end

def play_game
    begin_game
    game = Game.new
    game.display
    game.player_turns
end

play_game