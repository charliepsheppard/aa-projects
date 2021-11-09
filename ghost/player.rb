
class Player
  def initialize(name)
    @name = name
  end

  def guess
    response = gets.chomp
  end

  def alert_invalid_guess(string)
    alpha = ("a".."z").to_a
    if !alpha.include?(string)
      raise "Invalid guess"
    end
  end
end

p = Player.new("Charlie")
p.alert_invalid_guess("a")

















