class Hand
  attr_accessor :cards

  def initialize
    @cards = 0
  end

  def to_s
    @cards.each { |card| puts card }
  end

  def hide
    @cards.each { puts '*' }
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
end
