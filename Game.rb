
class Game
    attr_accessor :board, :cross_check, :possible_moves
    def initialize
        @board=Array.new(3) {Array.new(3, "-")}
        @cross_check=[[],[]]
        @possible_moves=[]
        @winner=""
        for i in 0..2
            for j in 0..2
                @possible_moves.push([i,j])
            end
        end
        
    end
    def is_full?
        result=false
        @board.each do |sub_arr|
            unless sub_arr.include?("-")
                result= true
            else
                result=false
            end
        end
        result
    end
    def new_board
        @board=Array.new(3) {Array.new(3, "-")}
    end
    
    def start_cross_check
      @cross_check=[[],[]]  
      i=0
      j=0
      3.times do
        @cross_check[0].push(@board[i][j])
        i+=1
        j+=1
      end
      m=2
      n=0
        3.times do 
          @cross_check[1].push(@board[m][n])
          m-=1
          n+=1
          
        end
         
    end    
    def print_board
        puts "    0    1    2  "
        puts "-----------------"
         
        i=0
        @board.each do |sub_array|
            print i.to_s + " "
            i+=1
            sub_array.each do |line|
                print "| #{line} |" 
            end 
            puts 
            puts "-----------------" 
        end
    end
    def is_over?
        vertical_check=[[],[],[]]
        m=0
        for i in 0..2
            for j in 0..2
               vertical_check[m].push(@board[j][i])
            end
            m+=1
        end 
        start_cross_check
        for i in 0..2
           if (board[i].uniq.size<=1 && !(board[i].uniq.include?("-"))) || (vertical_check[i].uniq.size<=1 && !(vertical_check[i].uniq.include?("-")))
             return true 
           end
        end
        i=0
        2.times do
            if @cross_check[i].uniq.size<=1 &&!(board[i].uniq.include?("-"))
                return true 
            end
            i+=1
        end
        false
    end
end


