class Journey
  attr_reader :entry_station
  attr_accessor :exit_station

  DEFAULT_PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def initialize(entry_station: nil, exit_station: nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def fare
    @entry_station.nil? || @exit_station.nil? ? DEFAULT_PENALTY_FARE : MINIMUM_FARE
  end

  def complete?
    !@exit_station.nil?
  end
end
