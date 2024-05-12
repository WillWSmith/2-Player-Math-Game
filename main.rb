require_relative 'player'

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

      # Prompt the player with a question

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