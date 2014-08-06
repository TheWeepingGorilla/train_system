require 'spec_helper'

describe 'Line' do
  it 'creates a line object' do
    test_line = Line.new("Blue")
    expect(test_line).to be_an_instance_of Line
  end
end

