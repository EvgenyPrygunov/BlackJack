#logic
class Logic

  attr_accessor :current_turn

  def initialize
    @player = ''
    @dealer = Dealer.new
    @deck = Deck.new
    @bank = Bank.new
    @choice = { 1 => :stand, 2 => :take_card, 3 => :face_up }
    @current_turn = 0
  end

  def start
    puts 'Hello! What is your name?'
    name = gets.chomp.to_s
    @player = Player.new(name)
    @player.cards = @deck.get_cards
    @dealer.cards = @deck.get_cards
    player_cards
    dealer_cards
    @bank.player_bank -= 10
    @bank.dealer_bank -= 10
    @bank.game_bank += 20
    player_turn
  end

  def player_cards
    puts "#{@player.name}, your cards:"
    @player.cards.each { |card| puts "#{card[0]}#{card[1]}" }
    puts "Summary: #{summary(@player)}"
  end

  def dealer_cards(stopgame = 0)
    puts 'Dealer cards:'
    if stopgame == 1
      @dealer.cards.each { |card| puts "#{card[0]}#{card[1]}" }
      puts "Summary: #{summary(@dealer)}"
    else
      @dealer.cards.each { |card| puts "*" }
    end
  end

  def player_turn
    @current_turn = 1
    puts 'Enter your choice: 1 - stand, 2 - take card, 3 - face up (open cards)'
    input = gets.chomp.to_i
    send @choice[input]
  end

  def dealer_turn
    @current_turn = 0
    if summary(@dealer) >= 17 || full?(@dealer)
      puts "Dealer stand"
      player_turn
    elsif summary(@dealer) < 17
      take_card
    end
    player_turn
  end

  def stand
    if full?(@player) && full?(@dealer)
      face_up
    elsif @current_turn == 1
      dealer_turn
    else
      player_turn
    end
  end

  def take_card
    if @current_turn == 1 && full?(@player)
      puts "#{@player.name} you are full. Choose again."
      player_turn
    elsif @current_turn == 1
      @player.cards << @deck.add_card
      player_cards
      dealer_turn
    elsif @current_turn == 0 && full?(@dealer)
      player_turn
    elsif @current_turn == 0
      @dealer.cards << @deck.add_card
    else
      face_up
    end
  end

  def face_up
    player_cards
    dealer_cards(1)
    if summary(@player) > 21
      puts "Dealer WIN!"
    elsif summary(@player) > summary(@dealer)
      puts "Player #{@player.name} WIN!"
    elsif summary(@player) == summary(@dealer)
      puts "DRAW!"
    else
      puts "Dealer WIN!"
    end
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

  def full?(person)
    true if person.cards.length == 3
  end

  def end_game
    face_up if full?(@player) && full?(@dealer)
  end
end
