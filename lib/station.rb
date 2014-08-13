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

  def ==(another_name)
    @name==another_name.name && @id==another_name.id
  end

end
