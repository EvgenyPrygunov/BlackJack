#making deck
class Deck
  SUIT = %w(♠ ♥ ♣ ♦)
  RANK = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  VALUE = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, [1, 11]]

  attr_reader :new_deck

  def initialize
    @new_deck = generate_deck
  end

  def generate_deck
    deck = []
    SUIT.each do |suit|
      RANK.each_with_index do |rank, index|
        deck << [suit, rank, VALUE[index]]
      end
    end
    deck.shuffle
  end
end
