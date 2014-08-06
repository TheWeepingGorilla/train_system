class Stop
  attr_reader :station_id, :line_id, :id

  def initialize station_id, line_id, id=nil
    @station_id = station_id.to_i
    @line_id = line_id.to_i
    @id = id
  end

  def self.all
    stops = []
    results = DB.exec("SELECT * FROM stops;")
    results.each do |stop|
      stops << Stop.new(stop["station_id"], stop["line_id"])
    end
    stops
  end

  def save
    result = DB.exec("INSERT INTO stops (station_id, line_id) VALUES ('#{@station_id}', '#{@line_id}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def == stop
    (stop.station_id == @station_id) && (stop.line_id == @line_id)
  end
end
