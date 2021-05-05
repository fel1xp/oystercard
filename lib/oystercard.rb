
class Oystercard
  MAX_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def topup(amount)
    raise 'Balance cannot exceed maximum balance' if (@balance + amount) > MAX_BALANCE

    @balance += amount
  end
end
