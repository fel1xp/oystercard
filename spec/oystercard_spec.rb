require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey) { { :entry => entry_station, :exit  => exit_station } }

  describe '.initialize' do
    it 'returns the 0 balance of a new Oyster account' do
      expect(oystercard.balance).to eq(0)
    end
  end

  describe 'maximum balance' do
    it 'returns  error if balance will exceed £90' do
      maximum_balance = Oystercard::MAX_BALANCE
      oystercard.topup(maximum_balance)
      expect { oystercard.topup(1) }.to raise_error "Balance cannot exceed #{Oystercard::MAX_BALANCE}"
    end
  end

  describe 'minimum balance' do
    it 'returns error if balance is less than 1' do
      expect { oystercard.touch_in(entry_station) }.to raise_error "Insufficient funds"
    end
  end
  
  describe '#top_up' do
    it 'can topup from the balance' do
      expect{ subject.topup(5) }.to change{ subject.balance }.by 5
    end
  end

  describe '#touch_in' do
    it 'turns in_journey? to true' do
      oystercard.topup(10)
      oystercard.touch_in(entry_station)
      expect(oystercard).to be_in_journey
    end
  end

  describe '#touch_out' do
    it 'turns in_journey? to false' do
      oystercard.touch_out(exit_station)
      expect(oystercard).not_to be_in_journey
    end
    it 'deducts the minimum fare amount' do
      oystercard.topup(10)
      oystercard.touch_in(entry_station)
      expect{ oystercard.touch_out(exit_station) }.to change{ oystercard.balance }.by -(Journey::MINIMUM_FARE)
    end
  end
  
  describe 'journey_history' do 
    it 'is in journey?' do
      oystercard.topup(10)
      oystercard.touch_in('Bond Street')
      expect(oystercard).to be_in_journey
    end
    
    it 'has an empty journey history by default' do
      expect(subject.journey_history).to be_empty
    end

    it 'records the entry and exit stations from the journey' do
      oystercard.topup(10)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(subject.journey_history).to include(journey) 
    end
  end
  
end