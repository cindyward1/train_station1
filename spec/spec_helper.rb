require 'pg'
require 'line'
require 'stop'
require 'station'
require 'pry'


DB = PG.connect({:dbname => "train_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lines *;")
    DB.exec("ALTER SEQUENCE lines_id_seq RESTART WITH 1;")
    DB.exec("DELETE FROM stops *;")
    DB.exec("ALTER SEQUENCE stops_id_seq RESTART WITH 1;")
    DB.exec("DELETE FROM stations *;")
    DB.exec("ALTER SEQUENCE stations_id_seq RESTART WITH 1;")
  end
end

def setup
  @test_line = Line.new({:name => "Orient Express"})
  @test_station = Station.new({:name => "Limbo"})
  @test_stop = Stop.new({:line_id => 1, :station_id => 3})
end
