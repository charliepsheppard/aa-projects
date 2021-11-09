class Card
  # A Card has two useful bits of information: its face value, and whether it is face-up or face-down. You'll want instance variables to keep track of this information. You'll also want a method to display information about the card: nothing when face-down, or its value when face-up. I also wrote #hide, #reveal, #to_s, and #== methods.

  #Common problem: Having issues with #hide and #reveal? Try testing small.

  attr_reader :value

  def initialize(value)
    @value = value
    @face = false
  end

  def hide
    @face = false
  end

  def reveal
    @face = true
  end

  def ==(other)
    self.value == other.value
  end
end

# b = Card.new("L")
# p b.hide
# p b.reveal
# p b.hide