require_relative "Game"
class User < Game
    attr_accessor :symbol
    def initialize(char)
        @symbol=char
        
    end
    def moves(arr, cor1, cor2)
        
        if arr[cor1][cor2]=="-"
           arr[cor1][cor2]=@symbol
           
        else  
            puts "Illegal Move, please choose again: "
            cor1=gets.chomp.to_i
            cor2=gets.chomp.to_i
            moves(arr, cor1, cor2)
        end
    end
    
end
game=Game.new
user1=User.new("X")
user2=User.new("O")

until game.is_over? do
    game.new_board if game.is_full?
    game.print_board
    puts "User 1 please select a coordinate: "
    x=gets.chomp.to_i
    y=gets.chomp.to_i
    user1.moves(game.board, x, y)
    game.print_board
    if game.is_over?
        puts "Well done User1"
        break;
    end
    game.new_board if game.is_full?
    game.print_board
    puts "User2 please select a coordinate: "
    x=gets.chomp.to_i
    y=gets.chomp.to_i
    user2.moves(game.board, x, y)
    game.print_board
    if game.is_over?
        puts "Well done user 2"
        break;
    end 
end

