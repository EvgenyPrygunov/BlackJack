class Deck
  SUIT = %w[♠ ♥ ♣ ♦].freeze
  RANK = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].freeze
  VALUE = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, [1, 11]].freeze

  attr_reader :cards

  def initialize
    @cards = []
  end

  def new_deck
    generate_deck
    @cards.shuffle!
  end

  def to_s
    @cards.each { |card| puts card }
  end

  def hide
    @cards.each { puts '*' }
  end

  def get_cards(game_deck)
    @cards = game_deck.cards.slice!(0, 2)
  end

  def add_card(game_deck)
    @cards << game_deck.cards.slice!(1)
  end

  def remove_cards
    @cards = []
  end

  def full?
    true if @cards.length == 3
  end

  def sum
    summary = 0
    @cards.each do |card|
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
        @cards << Card.new(suit, rank, VALUE[index])
      end
    end
  end
end
