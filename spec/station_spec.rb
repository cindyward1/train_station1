require 'spec_helper'

describe Station do
  before do
    setup
  end

  it "should initialize with a station name" do
    expect(@test_station).to be_an_instance_of Station
  end

  it "returns the attributes of the current station" do
    expect(@test_station.name).to eq "Limbo"
  end

  it 'saves the station to the stations table' do
    @test_station.save
    expect(Station.all).to eq [@test_station]
  end

  it "returns true if two stations have the same attributes" do
    @test_station.save
    test_station1 = Station.new({:name => "Limbo", :id=>@test_station.id})
    expect(test_station1).to eq @test_station
  end

  it "sets its ID when you save it" do
    @test_station.save
    expect(@test_station.id).to be_an_instance_of Fixnum
  end

  it "retrieves all the stations for a line" do
    @test_station.save
    @test_line.save
    test_stop = Stop.new({:line_id => @test_line.id, :station_id => @test_station.id})
    test_stop.save
    test_stations = Station.find_stations_from_line(@test_line.id)
    expect(test_stations.first).to eq @test_station
  end

end
