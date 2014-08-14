require 'spec_helper'

describe Line do
  before do
    setup
  end

  it 'initializes with a line name' do
    expect(@test_line).to be_an_instance_of Line
  end

  it 'returns the attributes of the current line' do
    expect(@test_line.name).to eq "Orient Express"
  end

  it "saves a line to the 'lines' table" do
    @test_line.save
    expect(Line.all).to eq [@test_line]
  end

  it "returns true if two lines have the same attributes" do
    @test_line.save
    test_line1 = Line.new({:name => "Orient Express", :id=>@test_line.id})
    expect(test_line1).to eq @test_line
  end

  it 'sets its ID when you save it' do
    @test_line.save
    expect(@test_line.id).to be_an_instance_of Fixnum
  end

  it "retrieves all the stations for a line" do
    @test_line.save
    @test_station.save
    test_stop = Stop.new({:line_id => @test_line.id, :station_id => @test_station.id})
    test_stop.save
    test_lines = Line.find_lines_from_station(@test_station.id)
    expect(test_lines.first).to eq @test_line
  end

end
