class Line

attr_reader :name, :id

  def initialize (attributes)
    @name = attributes[:name]
    @id = attributes[:id].to_i
  end

  def save
    results = DB.exec("INSERT INTO lines (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def self.all
    lines = []
    results = DB.exec("SELECT * FROM lines;")
      results.each do |result|
        attributes = {
          :name => result['name'],
          :id =>result['id'].to_i
        }
        current_line = Line.new(attributes)
        lines << current_line
      end
    lines
  end

  def ==(another_line)
    self.name == another_line.name && self.id == another_line.id
  end

  def self.find_lines_from_station(station_id)
    results = DB.exec("SELECT lines.* FROM stations JOIN stops ON (stops.station_id = stations.id) " +
                      "JOIN lines ON (lines.id = stops.line_id) WHERE stations.id = #{station_id};")
    lines = []
    results.each do |line|
      attributes = {
        :name => line['name'],
        :id => line['id'].to_i
      }
      current_line = Line.new(attributes)
      lines << current_line
    end
    lines
  end

  def self.delete(line_id)
    DB.exec("DELETE FROM lines WHERE id = #{line_id};")
    DB.exec("DELETE FROM stops WHERE line_id = #{line_id};")
  end

  def self.update(line_id, name)
    DB.exec("UPDATE lines SET name = '#{name}' WHERE id = #{line_id};")
  end

end
