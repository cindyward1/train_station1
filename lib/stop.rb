class Stop

attr_reader :line_id, :station_id, :id

  def initialize (attributes)
    @line_id = attributes[:line_id].to_i
    @station_id = attributes[:station_id].to_i
    @id = attributes[:id].to_i
  end

  # def save
  #   result = DB.exec("INSERT INTO stops (line_id, station_id) VALUES (#{@line_id}, #{@station_id}) RETURNING id;")
  #   @id = result['id'].to_i
  # end

  # def self.all
  #   stops = []
  #   results


end
