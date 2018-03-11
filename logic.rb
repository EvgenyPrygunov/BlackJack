require_relative 'player_module'
require_relative 'dealer_module'
require_relative 'win_check_module'

class Logic
  include PlayerModule
  include DealerModule
  include WinCheckModule

  attr_accessor :current_turn

  def initialize
    @player = ''
    @dealer = Dealer.new
    @deck = 0
    @bank = Bank.new
    @choice = { 1 => :stand, 2 => :take_card_player, 3 => :face_up }
    @current_turn = 0
  end

  def start
    player_name if @player == ''
    @deck = Deck.new
    @player.cards = @deck.get_cards
    @dealer.cards = @deck.get_cards
    player_cards
    dealer_cards
    @bank.player_bank -= 10
    @bank.dealer_bank -= 10
    @bank.game_bank += 20
    player_turn
  end

  def stand
    end_game_check
    if @current_turn == 1
      dealer_turn
    else
      player_turn
    end
  end

  def face_up
    player_cards
    dealer_cards_endgame
    dealer_win_check || player_win_check || draw_check
    @bank.game_bank = 0
    puts "Your bank is $#{@bank.player_bank}"
    bank_check
    game_finish
  end

  def new_game
    puts 'Do you want to start new game? 1 - Yes, 2 - No.'
    input = gets.chomp.to_i
    if input == 1
      @dealer = Dealer.new
      @bank = Bank.new
      start
    else
      exit
    end
  end

  def game_finish
    puts 'Do you want to play next round? 1 - Yes, 2 - No.'
    input = gets.chomp.to_i
    if input == 1
      start
    else
      exit
    end
  end

  def end_game_check
    face_up if @deck.full?(@player) && @deck.full?(@dealer)
  end

  def bank_check
    if @bank.player_bank <= 0
      puts "Player #{@player.name} has lost the whole game!"
      new_game
    elsif @bank.dealer_bank <= 0
      puts "Player #{@player.name} has won the whole game!"
      new_game
    end
  end
end
