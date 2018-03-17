require_relative 'win_module'
require_relative 'check_module'

class Logic
  include WinModule
  include CheckModule

  attr_accessor :bank, :player, :dealer, :game_deck

  def initialize
    @int = Interface.new
    @player ||= player_check
    @dealer = Dealer.new
    @bank = Bank.new
    @game_deck = 0
    @choice = { 1 => :stand, 2 => :take_card, 3 => :face_up }
    @choice_check = []
  end

  def start
    @game_deck = Deck.new
    @game_deck.new_deck
    @player.hand.cards = @game_deck.give_start_cards
    @dealer.hand.cards = @game_deck.give_start_cards
    @int.player_sum(@player)
    @dealer.hand.hide
    @bank.start_game
    player_turn
    dealer_turn
  end

  def player_turn
    if @choice_check.include?('stand') && @choice_check.include?('take card')
      face_up
    elsif @choice_check.include?('stand')
      input = @int.ask_for_number('Choice: 2-take card, 3-face up')
    elsif @choice_check.include?('take card')
      input = @int.ask_for_number('Choice: 1-stand, 3-face up')
    else
      input = @int.ask_for_number('Choice: 1-stand, 2-take card, 3-face up')
    end
    send @choice[input]
  end

  def dealer_turn
    if @dealer.hand.sum >= 17 || @dealer.hand.full?
      puts 'Dealer stand. Your turn.'
      stand(@dealer)
    else
      take_card(@dealer)
    end
  end

  def take_card(person = @player)
    auto_face_up_check
    person.hand.cards << @game_deck.give_card until person.hand.full?
    if person == @player
      @choice_check << 'take card'
      @int.player_sum(@player)
    else
      player_turn
    end
  end

  def stand(person = @player)
    auto_face_up_check
    if person == @player
      @choice_check << 'stand'
      dealer_turn
    else
      player_turn
    end
  end

  def face_up
    @int.round_info(@player, @dealer)
    win_check
    @bank.game_bank = 0
    @int.bank_info(@bank.player_bank)
    @player.hand.remove_cards
    @dealer.hand.remove_cards
    @choice_check = []
    bank_check
    game_finish
  end

  def win_check
    dealer_win_check || player_win_check || draw_check
  end

  def new_game
    input = @int.ask_for_number('Do you want to start new game? 1-Yes, 2-No.')
    if input == 1
      @dealer = Dealer.new
      @bank = Bank.new
      start
    else
      exit
    end
  end

  def game_finish
    input = @int.ask_for_number('Do you want to play next round? 1-Yes, 2-No.')
    if input == 1
      start
    else
      exit
    end
  end
end
