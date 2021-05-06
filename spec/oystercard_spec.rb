require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:entry_station) { double :station }

  describe '.initialize' do
    it 'returns the 0 balance of a new Oyster account' do
      expect(oystercard.balance).to eq (0)
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

  describe 'entry_station' do
    it 'records entry_station when touching in' do
      oystercard.topup(10)
      oystercard.touch_in('Bond Street')
      expect(oystercard.entry_station).to eq('Bond Street')
    end
  end

  describe '#touch_in' do
    it 'turns in_journey? to true' do
      oystercard.topup(10)
      oystercard.touch_in(entry_station)
      expect(oystercard.in_journey).to eq (true)
    end
  end

  describe '#touch_out' do
    it 'turns in_journey? to false' do
      oystercard.touch_out
      expect(oystercard.in_journey).to eq (false)
    end
    it 'deducts the minimum fare amount' do
      oystercard.topup(10)
      oystercard.touch_in(entry_station)
      expect{ oystercard.touch_out }.to change{ oystercard.balance }.by -(Oystercard::MIN_FARE)
    end
  end

  it 'is in journey?' do
    oystercard.topup(10)
    oystercard.touch_in('Bond Street')
    expect(oystercard).to be_in_journey
  end

  

end