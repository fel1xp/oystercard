require 'oystercard'

describe Oystercard do
 

  describe '#initialize' do
    it 'returns the 0 balance of a new Oyster account' do
      oystercard = Oystercard.new
      expect(oystercard.balance).to eq (0)
    end
  end

  describe 'maximum balance' do
    it 'returns  error if balance will exceed £90' do
      oystercard = Oystercard.new
      maximum_balance = Oystercard::MAX_BALANCE
      oystercard.topup(maximum_balance)
      expect { oystercard.topup(1) }.to raise_error "Balance cannot exceed #{Oystercard::MAX_BALANCE}"
    end
  end

  describe '#deduct' do
    it 'can deduct from the balance' do
      expect{ subject.deduct(5) }.to change{ subject.balance }.by -5
    end
  end
  
  describe '#top_up' do
    it 'can topup from the balance' do
      expect{ subject.topup(5) }.to change{ subject.balance }.by 5
    end
  end

  describe '#touch_in' do
    it 'turns in_journey? to true' do
      oystercard = Oystercard.new
      oystercard.touch_in
      expect(oystercard.in_journey).to eq (true)
    end
  end

  describe '#touch_out' do
    it 'turns in_journey? to false' do
      oystercard = Oystercard.new
      oystercard.touch_out
      expect(oystercard.in_journey).to eq (false)
    end
  end

end
