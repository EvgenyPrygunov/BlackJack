class Player < Dealer
  attr_accessor :name, :hand

  def initialize(name)
    @hand = Hand.new
    @name = name
  end
end
