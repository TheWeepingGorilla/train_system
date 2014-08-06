require 'spec_helper'

describe 'Line' do
  it 'creates a line object' do
    test_line = Line.new("Blue")
    expect(test_line).to be_an_instance_of Line
  end

  describe '.all' do
    it 'returns an empty array' do
      expect(Line.all).to eq []
    end
  end

  describe 'save' do
    it 'saves a line to the database' do
      test_line = Line.new("Blue")
      test_line.save
      expect(Line.all).to eq [test_line]
    end
  end
end

