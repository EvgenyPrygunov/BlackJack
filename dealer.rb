class Dealer
  attr_accessor :deck

  def initialize(logic)
    @logic = logic
    @deck = 0
    @choice = { 1 => :stand, 2 => :take_card, 3 => :face_up }
  end

  def make_deck
    @deck = Deck.new
  end

  def turn
    if @deck.sum >= 17 || @deck.full?
      stand
    elsif @deck.sum < 17
      take_card
    end
  end

  def take_card
    @deck.add_card(@logic.bank_deck)
  end

  def stand
    face_up if @logic.player.deck.full?
    @logic.player.turn
  end

  def face_up
    puts @logic.player.deck
    puts "Player summary #{@logic.player.deck.sum}"
    puts @logic.dealer.deck
    puts "Dealer summary #{@logic.dealer.deck.sum}"
    @logic.win_check
    @logic.bank.game_bank = 0
    puts "Your bank is $#{@logic.bank.player_bank}"
    @logic.bank_check
    @logic.game_finish
  end
end
