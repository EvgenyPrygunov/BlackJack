require_relative 'win_check_module'

class Logic
  include WinCheckModule

  attr_accessor :bank_deck, :bank, :player, :dealer

  def initialize
    @player ||= player_check
    @dealer = Dealer.new(self)
    @bank_deck = 0
    @bank = Bank.new
    @int = Interface.new
  end

  def start
    @bank_deck = Deck.new
    @bank_deck.new_deck
    @player.make_deck
    @dealer.make_deck
    @player.deck.get_cards(@bank_deck)
    @dealer.deck.get_cards(@bank_deck)
    puts @player.deck
    puts @dealer.deck
    puts "Player summary #{@player.deck.sum}"
    @dealer.deck.hide
    @bank.start_game
    gameplay
  end

  def gameplay
    @player.turn
    @dealer.turn
    @player.turn unless @player.deck.full?
    @dealer.face_up
  end

  def dealer_turn
    if @dealer.deck.sum >= 17 || @dealer.deck.full?
      puts 'Dealer stand. Your turn.'
    elsif @dealer.deck.sum < 17
      @dealer.deck.add_card(@bank_deck)
    end
  end

  def player_check
    puts 'Hello! What is your name?'
    name = gets.chomp.to_s
    @player = Player.new(self, name)
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

  def win_check
    dealer_win_check || player_win_check || draw_check
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
