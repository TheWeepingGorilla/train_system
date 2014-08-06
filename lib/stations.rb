class Station
  attr_reader :name, :id

  def initialize name, id=nil
    @name = name
    @id = id
  end

  def self.all
    stations = []
    results = DB.exec("SELECT * FROM stations;")
    results.each do |station|
      stations << Station.new(station["name"], station["id"])
    end
    stations
  end

  def save
    result = DB.exec("INSERT INTO stations (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def == station_name
    station_name == @name
  end
end
