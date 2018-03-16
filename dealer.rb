class Dealer
  attr_accessor :deck

  def initialize(deck)
    @deck = deck
  end

  def take_card(game_deck)
    @deck.add_card(game_deck)
  end
end
