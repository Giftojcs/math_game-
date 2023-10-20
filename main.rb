require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/question'

puts "Enter the name of Player 1: "
player1_name = gets.chomp
puts "Enter the name of Player 2: "
player2_name = gets.chomp

player1 = Player.new(player1_name)
player2 = Player.new(player2_name)

game = MathGame.new(player1, player2)

while player1.get_lives != "0/3" && player2.get_lives != "0/3"
  question = Question.generate
  current_player = game.current_player  # Get the current player
  puts "\n---NEW TURN---"
  puts "#{current_player.name}'s turn. Lives: P1: #{player1.get_lives} vs P2: #{player2.get_lives}"
  current_player.answer_question(question)  # Use the current player
  puts "Scores: P1: #{player1.get_score} vs P2: #{player2.get_score}"
  game.switch_turn
end

puts "\n-----GAME OVER------"
game.announce_winner
puts "\nGood bye!"

