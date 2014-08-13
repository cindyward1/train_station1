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
    expect(@test_station==@test_station).to eq true
  end
end
