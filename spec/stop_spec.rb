require 'spec_helper'

describe Stop do
  before do
    setup
  end

  it "initializes a new stop" do
    expect(@test_stop).to be_an_instance_of Stop
  end

  it "returns the attributes of the current stop" do
    expect(@test_stop.line_id).to eq 1
    expect(@test_stop.station_id).to eq 3
  end

  it "creates a stop from a station and a line" do
    @test_station.save
    @test_line.save
    test_stop = Stop.new({:line_id => @test_line.id, :station_id => @test_station.id})
    test_stop.save
    expect(test_stop.line_id).to eq @test_line.id
    expect(test_stop.station_id).to eq @test_station.id
    expect(Stop.all).to eq [test_stop]
  end

end
