class Stop

attr_reader :line_id, :station_id, :id

  def initialize (attributes)
    @line_id = attributes[:line_id].to_i
    @station_id = attributes[:station_id].to_i
    @id = attributes[:id].to_i
  end

  def save
    result = DB.exec("INSERT INTO stops (line_id, station_id) VALUES (#{@line_id}, #{@station_id}) RETURNING id;")
    @id = result.first['id'].to_i
  end

  def self.all
    stops = []
    results = DB.exec("SELECT * FROM stops;")
    results.each do |result|
      attributes = {
        :line_id => result['line_id'].to_i,
        :station_id => result['station_id'].to_i,
        :id => result['id'].to_i
      }
      current_stop = Stop.new(attributes)
      stops << current_stop
    end
    stops
  end

  def ==(another_stop)
    self.line_id==another_stop.line_id && self.station_id==another_stop.station_id
  end

  def self.delete(stop_id)
    DB.exec("DELETE FROM stops WHERE id = #{stop_id};")
  end
end
