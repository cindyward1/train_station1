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
    (@name == another_line.name) && (@id == another_line.id)
  end

end
