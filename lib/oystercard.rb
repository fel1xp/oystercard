
class Oystercard
  MAX_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def topup(amount)
    raise "Balance cannot exceed #{MAX_BALANCE}" if (@balance + amount) > MAX_BALANCE

    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end


end
