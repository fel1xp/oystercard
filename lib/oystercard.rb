
class Oystercard
  MAX_BALANCE = 90

  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def topup(amount)
    raise "Balance cannot exceed #{MAX_BALANCE}" if (@balance + amount) > MAX_BALANCE

    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end