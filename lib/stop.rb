class Stop

attr_reader :line_id, :station_id, :id

  def initialize (attributes)
    @line_id = attributes[:line_id]
    @station_id = attributes[:station_id]
    @id = attributes[:id]
  end

end
