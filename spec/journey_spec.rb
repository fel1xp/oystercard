require 'journey'

describe Journey do
  it 'has a default penalty' do
    journey = Journey.new
    expect(journey.fare).to eq(Journey::DEFAULT_PENALTY_FARE)
  end

  context 'when given an entry station' do
    let(:journey) { Journey.new(entry_station: 'Bond Street') }
    describe '#entry_station' do
      it 'returns entry_station' do
        expect(journey.entry_station).to eq('Bond Street')
      end
    end

    describe '#complete?' do
      it 'returns false' do
        expect(journey).not_to be_complete
      end
    end

    describe '#fare' do
      it 'returns the default penalty fare' do
        expect(journey.fare).to eq(Journey::DEFAULT_PENALTY_FARE)
      end
    end

    context 'when given an exit station' do
      before { journey.exit_station = 'Stratford' }
      describe '#exit_station' do
        it 'returns exit_station' do
          expect(journey.exit_station).to eq('Stratford')
        end
      end

      describe '#complete?' do
        it 'returns true' do
          expect(journey).to be_complete
        end
      end

      describe '#fare' do
        it 'returns the minimum fare' do
          expect(journey.fare).to eq(Journey::MINIMUM_FARE)
        end
      end
    end
  end

  context 'when given an exit station, with no entry station' do
    let(:journey) { Journey.new(exit_station: 'Stratford') }
    describe '#exit_station' do
      it 'returns exit_station' do
        expect(journey.exit_station).to eq('Stratford')
      end
    end

    describe '#complete?' do
      it 'returns true' do
        expect(journey).to be_complete
      end
    end

    describe '#fare' do
      it 'returns the default penalty fare' do
        expect(journey.fare).to eq(Journey::DEFAULT_PENALTY_FARE)
      end
    end
  end
end
