class Player < Dealer
  attr_accessor :name, :deck

  def initialize(deck, name = 0)
    super(deck)
    @name = name
  end
end
