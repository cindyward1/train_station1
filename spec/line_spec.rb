require 'spec_helper'

describe Line do
  before do
    setup
  end

  it 'initializes with a line name' do
    expect(@test_line).to be_an_instance_of Line
  end

  it 'returns the attributes of the current line' do
    expect(@test_line.name).to eq "Yellow"
  end

end
