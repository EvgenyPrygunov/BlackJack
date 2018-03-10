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
    current_cards
  end

  def current_cards
    puts 'Your cards:'
    @player.cards.each { |card| puts "#{card[0]}#{card[1]}" }
    puts "Summary: #{summary(@player)}"
    puts 'Dealer cards:'
    @player.cards.each { |card| puts "*" }
  end

  def summary(person)
    sum = 0
    person.cards.each do |card|
      if card[1] == 'Ace' && sum < 11
        sum += card[2][1]
      elsif card[1] == 'Ace' && sum >= 11
        sum += card[2][0]
      else
        sum += card[2]
      end
    end
    sum
  end
end
