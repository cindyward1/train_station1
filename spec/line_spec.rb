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

  it "saves a line to the 'lines' table" do
    @test_line.save
    expect(Line.all).to eq [@test_line]
  end

  it "returns true if two lines have the same attributes" do
    @test_line.save
    expect(@test_line==@test_line).to eq true
  end

end
