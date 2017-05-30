# Creates board and a draw method
class Board
    def initialize
      @space= {A1: ' ', A2: ' ', A3: ' ',
              B1: ' ', B2: ' ', B3: ' ',
              C1: ' ', C2: ' ', C3: ' '
              }
      @turn= 0
      @letter= 'X'
    end

    def letter
      @letter
    end

    def take_turn
      puts "Player #{@letter} where would you like to play?"
      loop do
        input= gets.chomp.upcase.to_sym
        if @space[input]== ' '
          @space[input]=@letter
          break
        elsif @space[input]== nil
          puts "Invalid move. Accepted moves are A1,A2,A3,B1,B2,B3,C1,C2,C3."
        elsif @space[input]!= nil && @space != ' '
          puts "Space taken. Try again."
        else
          puts "Invalid Syntax. Try again"
        end
      end
        @turn+=1
    end

    def change_player
      if @letter=='X'
        @letter='O'
      elsif @letter=='O'
        @letter='X'
      end
    end

    def draw
      puts "   1  2  3"
      puts "A #{@space[:A1]} | #{@space[:A2]} | #{@space[:A3]}"
      puts "  --+---+--"
      puts "B #{@space[:B1]} | #{@space[:B2]} | #{@space[:B3]}"
      puts "  --+---+--"
      puts "C #{@space[:C1]} | #{@space[:C2]} | #{@space[:C3]}"
    end

    def win
      @winning_spaces=[
        [:A1,:A2,:A3],[:B1,:B2,:B3],[:C1,:C2,:C3], #horizontal
        [:A1,:B1,:C1],[:A2,:B2,:C2],[:A3,:B3,:C3], #vertical
        [:A1,:B2,:C3],[:A3,:B2,:C1] #diagonal
      ]
      @winning_spaces.each do |win|
        return true if @space[win[0]]==@space[win[1]] && @space[win[0]]==@space[win[2]] && (@space[win[0]]=='X' || @space[win[0]]=='O')
      end
      return false
    end

    def tie
      return true if @turn==9
    end
end
