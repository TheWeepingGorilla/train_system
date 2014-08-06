require 'spec_helper'

describe 'Station' do
  it 'creates a station object' do
    test_station = Station.new("N Downtown")
    expect(test_station).to be_an_instance_of Station
  end

  describe '.all' do
    it 'returns an empty array' do
      expect(Station.all).to eq []
    end
  end

  describe 'save' do
    it 'saves a station to the database' do
      test_station = Station.new("N Downtown")
      test_station.save
      expect(Station.all).to eq [test_station]
    end
  end

  describe '.lookup_by_id' do
    it 'returns name of station when supplied a station id' do
      test_station = Station.new("Downtown")
      testy_station = Station.new("Uptown")
      test_station.save
      testy_station.save
      expect(Station.lookup_by_id(testy_station.id)).to eq testy_station
    end
  end
end

