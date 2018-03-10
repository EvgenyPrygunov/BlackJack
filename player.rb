#player
class Player
  attr_accessor :name, :cards, :bank

  def initialize(name)
    @name = name
    @cards = 0
    @bank = 0
  end
end
