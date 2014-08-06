class Line
  attr_reader :name, :id

  def initialize name, id=nil
    @name = name
    @id = id
  end

  def self.all
    lines = []
    results = DB.exec("SELECT * FROM lines;")
    results.each do |line|
      lines << Line.new(line["name"], line["id"])
    end
    lines
  end

  def save
    result = DB.exec("INSERT INTO lines (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def == line_name
    line_name == @name
  end


end
