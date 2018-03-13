class Card

  attr_reader :suit, :rank, :score

  def initialize(suit, rank, score)
    @suit = suit
    @rank = rank
    @score = score
  end

  def to_s
    "#{@suit}#{@rank}"
  end
end
