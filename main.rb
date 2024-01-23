require './player.rb'
require './questions.rb'

class Main
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end

  def display_lives_remaining
    puts "P1: #{@player1.lives_remaining}/3 vs P2: #{@player2.lives_remaining}/3"
  end

  def switch_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def play_game
    while @player1.lives_remaining > 0 && @player2.lives_remaining > 0

      puts "----- NEW TURN -----"
      question = Question.new(@current_player.name)
      question.generate_question
      player_guess = gets.chomp
      question.check_answer(player_guess, @current_player)
      display_lives_remaining

      if @player1.lives_remaining <= 0 || @player2.lives_remaining <= 0
        break
      end
      switch_player
    end

    winner = @player1.lives_remaining > 0 ? @player1 : @player2

    puts "#{winner.name} wins with a score of #{winner.lives_remaining}/3! 🏆"

    puts '----- GAME OVER -----'
    puts 'Good bye!'
  end
end

Main.new.play_game
