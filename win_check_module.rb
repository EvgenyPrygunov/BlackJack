module WinCheckModule
  def player_win_check
    if summary(@player) > 21
      puts 'Dealer WIN!'
      @bank.dealer_bank += 20
    elsif summary(@dealer) > 21 || (summary(@player) > summary(@dealer))
      puts "Player #{@player.name} WIN!"
      @bank.player_bank += 20
    end
  end

  def dealer_win_check
    if summary(@dealer) > 21 && summary(@player) <= 21
      puts "Player #{@player.name} WIN!"
      @bank.player_bank += 20
    elsif summary(@player) > 21 || (summary(@dealer) > summary(@player))
      puts 'Dealer WIN!'
      @bank.dealer_bank += 20
    end
  end

  def draw_check
    return unless summary(@player) == summary(@dealer)
    puts 'DRAW!'
    @bank.player_bank += 10
    @bank.dealer_bank += 10
  end
end
