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

  def self.lookup_by_id station_id
    result = DB.exec("SELECT * FROM stations WHERE id = '#{station_id}';")[0]
    target_station = Station.new(result['name'], result['id'])
    target_station
  end

  def self.delete station_id
    DB.exec("DELETE FROM stations WHERE id = '#{station_id}';")
    DB.exec("DELETE FROM stops WHERE station_id = '#{station_id}';")

  end
end
