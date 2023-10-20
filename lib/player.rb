class Player
  attr_accessor :name, :lives, :score

  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
  end

  def answer_question(question)
    print "#{name}: What does #{question} equal?\n> "
    answer = gets.chomp

    if answer.to_i == eval(question)
      puts "#{name}: YES! You are correct."
      @score += 1
    else
      puts "#{name}: Seriously? No!"
      @lives -= 1
    end
  end

  def get_score
    "#{score}/3"
  end

  def get_lives
    "#{lives}/3"
  end
end

