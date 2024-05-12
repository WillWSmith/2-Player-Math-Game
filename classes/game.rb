require './classes/player'
require './classes/question'

class Game
  def initialize
    @player1 = Player.new(get_player_name(1))
    @player2 = Player.new(get_player_name(2))
    @current_player = @player1
  end

  def play
    loop do
      # Display whos turn it is
      puts "It's #{@current_player.name}'s turn."

      # Create Question
      question = Question.new

      # Prompt the player with a question
      player_answer = question.ask_question(@current_player.name)

      # Check if the player's answer is correct
      if player_answer == question.correct_answer
        @current_player.gain_score
        puts "Correct! Your score is now: #{@current_player.score}"
      else
        @current_player.lose_life
        puts "Incorrect! Your remaining lives are now: #{@current_player.lives}"
      end

      # Switch to the next player for the next turn
      @current_player = (@current_player == @player1) ? @player2 : @player1

      break if game_over?
    end

    announce_winner
  end
  private

  def get_player_name(player_number)
    puts "Enter name for player #{player_number}:"
    gets.chomp
  end

  def game_over?
    @player1.game_over? || @player2.game_over?
  end

  def announce_winner
    winner = @player1.game_over? ? @player2 : @player1
    puts "#{winner.name} wins with a score of #{winner.score}"
  end
end