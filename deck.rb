class Deck
  SUIT = %w(♠ ♥ ♣ ♦)
  RANK = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  VALUE = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, [1, 11]]

  attr_reader :deck

  def initialize
    @deck = []
  end

  def new_deck
    generate_deck
    @deck.shuffle!
  end

  def to_s
    @deck.each { |card| puts card }
  end

  def hide
    @deck.each { |card| puts '*' }
  end

  def get_cards(bank_deck)
    @deck = bank_deck.deck.slice!(0, 2)
  end

  def add_card(bank_deck)
    @deck << bank_deck.deck.slice!(1)
  end

  def full?
    true if @deck.length == 3
  end

  def sum
    summary = 0
    @deck.each do |card|
      if card.rank == 'Ace' && summary < 11
        summary += 11
      elsif card.rank == 'Ace' && summary >= 11
        summary += 1
      else
        summary += card.score
      end
    end
    summary
  end

  private

  def generate_deck
    SUIT.each do |suit|
      RANK.each_with_index do |rank, index|
        @deck << Card.new(suit, rank, VALUE[index])
      end
    end
  end
end
