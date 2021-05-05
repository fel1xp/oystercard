
class Oystercard
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1

  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def topup(amount)
    raise "Balance cannot exceed #{MAX_BALANCE}" if (@balance + amount) > MAX_BALANCE

    @balance += amount
  end  

  def touch_in
    fail "Insufficient funds" if @balance < MIN_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MIN_FARE)
  end

  private

  def deduct(fare)
    @balance -= fare
  end
end