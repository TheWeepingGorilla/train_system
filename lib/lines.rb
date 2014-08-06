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

  def self.lookup_by_id line_id
    result = DB.exec("SELECT * FROM lines WHERE id = '#{line_id}';")[0]
    target_line = Line.new(result['name'], result['id'])
    target_line
  end

  def self.delete line_id
    DB.exec("DELETE FROM lines WHERE id = '#{line_id}';")
  end
end
