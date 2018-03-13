class Player < Dealer

  attr_accessor :name, :deck

  def initialize(logic, name)
    @logic = logic
    @name = name
    @deck = 0
    @choice = { 1 => :stand, 2 => :take_card, 3 => :face_up }
  end

  def turn
    puts 'Enter your choice: 1 - stand, 2 - take card, 3 - face up (open cards)' if self.is_a? Player
    input = gets.chomp.to_i
    send @choice[input]
  end

  def take_card
    face_up if @deck.full?
    super
    puts @deck
    puts "Player summary #{@deck.sum}"
  end

  def stand
    @logic.dealer.face_up if @deck.full? && @logic.dealer.deck.full?
    @logic.dealer.turn
  end
end
