#logic
class Logic
  def initialize
    @player = ''
    @dealer = Dealer.new
    @deck = Deck.new
    #@bank = Bank.new
  end

  def start
    puts 'Hello! What is your name?'
    name = gets.chomp.to_s
    @player = Player.new(name)
    @player.cards = @deck.get_cards(2)
    @dealer.cards = @deck.get_cards(2)
    puts 'Your cards:'
    @player.cards.each { |card| puts "#{card[0]}#{card[1]}" }
    puts 'Dealer cards:'
    @player.cards.each { |card| puts "*" }
  end


end
