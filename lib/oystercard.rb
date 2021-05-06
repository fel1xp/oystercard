
class Oystercard
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1

  attr_reader :balance, :entry_station, :exit_station, :journey_history



  def initialize
    @balance = 0
    @journey_history = []
  end

  def topup(amount)
    raise "Balance cannot exceed #{MAX_BALANCE}" if (@balance + amount) > MAX_BALANCE

    @balance += amount
  end  

  def touch_in(entry_station)
    @entry_station = entry_station
    fail "Insufficient funds" if @balance < MIN_BALANCE
  end

  def touch_out(exit_station)
    @exit_station = exit_station
    journey_history.push(:entry => @entry_station, :exit  => @exit_station)
    deduct(MIN_FARE)
    @entry_station = nil
  end

  def in_journey?
    entry_station.nil? ? false : true
  end

  private

  def deduct(fare)
    @balance -= fare
  end
end