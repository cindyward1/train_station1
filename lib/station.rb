class Station

attr_reader :name, :id

  def initialize (attributes)
    @name = attributes[:name]
    @id = attributes[:id].to_i
  end

  def save
    result = DB.exec("INSERT INTO stations (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def self.all
    stations = []
    results = DB.exec("SELECT * FROM stations")
      results.each do |station|
        attributes = {
          :name => station['name'],
          :id => station['id']
        }
        current_station = Station.new(attributes)
        stations << current_station
      end
    stations
  end

  def ==(another_station)
    self.name == another_station.name && self.id == another_station.id
  end

  def self.find_stations_from_line(line_id)
    results = DB.exec("SELECT stations.* FROM lines JOIN stops ON (lines.id = stops.line_id) " +
                      "JOIN stations ON (stops.station_id = stations.id) WHERE lines.id = #{line_id};")
    stations = []
    results.each do |station|
      attributes = {
        :name => station['name'],
        :id => station['id'].to_i
      }
      current_station = Station.new(attributes)
      stations << current_station
    end
    stations
  end

end
