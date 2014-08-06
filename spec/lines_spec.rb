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

  describe '#save' do
    it 'saves a line to the database' do
      test_line = Line.new("Blue")
      test_line.save
      expect(Line.all).to eq [test_line]
    end
  end

  describe '.lookup_by_id' do
    it 'returns name of line when supplied a line id' do
      test_line = Line.new("Blue")
      testy_line = Line.new("Green")
      test_line.save
      testy_line.save
      expect(Line.lookup_by_id(testy_line.id)).to eq testy_line
    end
  end

  describe '#delete' do
    it 'deletes a line from the database' do
      test_line = Line.new("Blue")
      test_line.save
      testy_line = Line.new("Green")
      testy_line.save
      testicle_line = Line.new("Red")
      testicle_line.save
      testicular_line = Line.new("Yellow")
      testicular_line.save
      Line.delete(testicle_line.id)
      expect(Line.all).to eq [test_line,testy_line,testicular_line]
    end
  end
end

