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

  def give_start_cards
    @cards.slice!(0, 2)
  end

  def give_card
    @cards.slice!(1)
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
