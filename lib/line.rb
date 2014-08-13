class Line

attr_reader :name, :id, :stations

def initialize (attributes)
  @name = attributes[:name]
  @id = attributes[:id]
  @stations = attributes[:stations]
end

end
