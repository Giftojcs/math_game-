class MathGame
  attr_reader :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def switch_turn
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def generate_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    "#{num1} + #{num2}"
  end

  def check_answer(answer, question)
    answer.to_i == eval(question)
  end

  def announce_winner
    if @player1.get_lives == "0/3"
      puts "#{@player2.name} wins with a score of #{@player2.get_score}"
    elsif @player2.get_lives == "0/3"
      puts "#{@player1.name} wins with a score of #{@player1.get_score}"
    else
      puts "The game ended in a draw!"
    end
  end

  def start_game
    until @player1.get_lives == "0/3" || @player2.get_lives == "0/3"
      question = generate_question
      puts "\n---NEW TURN---"
      puts "#{@current_player.name}'s turn. Lives: P1: #{@player1.get_lives} vs P2: #{@player2.get_lives}"
      @current_player.answer_question(question)
      puts "Scores: P1: #{@player1.get_score} vs P2: #{@player2.get_score}"
      switch_turn
    end

    puts "\n-----GAME OVER------"
    announce_winner
  end
end