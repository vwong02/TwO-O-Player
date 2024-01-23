class Question
  def initialize(player_name)
    @player_name = player_name
  end

  def generate_question
    @random_number1 = rand(1..20)
    @random_number2 = rand(1..20)
    puts "#{@player_name}: what is #{@random_number1} + #{@random_number2} 🤔"
  end

  # def ask_question
  #   puts "#{@player_name}: what is #{@random_number1} + #{@random_number2}?"
  # end

  def check_answer(player_guess, player)

    if !player_guess.match?(/^-?\d+(\.\d*)?$/)
      puts "Sorry, #{@player_name}, that's a valid number."
      player.lose_life

    elsif player_guess.to_i == @random_number1 + @random_number2
      puts "YES, you are correct! ✅"

    else
      puts "NO, that is incorrect. ❌"

      player.lose_life
    end

  end
end
