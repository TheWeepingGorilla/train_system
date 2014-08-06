require 'spec_helper'


describe 'Stop' do
  it 'creates a stop object' do
    test_stop = Stop.new(1, 2)
    expect(test_stop).to be_an_instance_of Stop
  end

  describe '.all' do
    it 'returns an empty array' do
      expect(Stop.all).to eq []
    end
  end

  describe '#save' do
    it 'saves a stop to the database' do
      test_station = Station.new("N Downtown")
      test_station.save
      test_line = Line.new("Blue")
      test_line.save
      test_stop = Stop.new(test_station.id, test_line.id)
      test_stop.save
      expect(Stop.all).to eq [test_stop]
    end
  end
end

