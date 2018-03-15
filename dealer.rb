class Dealer
  attr_accessor :deck

  def initialize(deck)
    @deck = deck
  end

  def take_card(bank_deck)
    @deck.add_card(bank_deck)
  end
end
