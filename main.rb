require_relative 'board'

game=Board.new

puts "Acceptable moves are A1,A2,A3,B1,B2,B3,C1,C2,C3"
game.draw

until game.win || game.tie
  game.take_turn
  game.draw
  puts ''
  if game.win
    puts "Player #{game.letter} has won!"
  elsif game.tie
    puts "Game is tied"
  end
  game.change_player
end
