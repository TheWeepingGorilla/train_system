require 'pg'
require 'pry'
require './lib/lines'
require './lib/stations'
require './lib/stops'

DB = PG.connect({:dbname => 'train_system'})

def linespace
  puts "\n"
end

def header
  system 'clear'
  puts "
  ╔══╦═╦══╦══╦═╦╗  ╔══╦═╦╦══╦══╦═╦═╦═╗
  ╚╗╔╣╬║╔╗╠║║╣║║║  ║══╬╗║║══╬╗╔╣╦╣║║║║
   ║║║╗╣╠╣╠║║╣║║║  ╠══╠╩╗╠══║║║║╩╣║║║║
   ╚╝╚╩╩╝╚╩══╩╩═╝  ╚══╩══╩══╝╚╝╚═╩╩═╩╝
"
end

def main_menu
  loop do
    linespace
    puts "SA > Add a station."
    puts "SL > List the stations."
    puts "LA > Add a line."
    puts "LL > List the lines."
    puts "AS > Add a stop."
    puts "LS > List the stops."
    puts "XX > Exit."
    linespace
    main_choice = gets.chomp.upcase
    if main_choice == "SA"
      station_add
    elsif main_choice == "SL"
      station_list
    elsif main_choice == "LA"
      line_add
    elsif main_choice == "LL"
      line_list
    elsif main_choice == "AS"
      add_stop
    elsif main_choice == "LS"
      list_stops
    elsif main_choice == "XX"
      puts "OK.  Have a good one."
      linespace
      exit
    else
      system 'clear'
      puts "Invalid! Try again"
    end
  end
end

def station_add
  puts "Enter name of station to add:"
  name = gets.chomp
  new_station = Station.new(name)
  new_station.save
  system 'clear'
end

def station_list
  linespace
  puts "Station ID : Station Name"
  puts "-------------------------"
  results = Station.all
  results.each do |result|
    puts result.id + "          : " + result.name
  end
end

def line_add
  puts "Enter name of line to add:"
  name = gets.chomp
  new_line = Line.new(name)
  new_line.save
  system 'clear'
end

def line_list
  linespace
  puts "Line ID : Line Name"
  puts "-------------------"
  results = Line.all
  results.each do |line|
    puts line.id + "       : " + line.name
  end
end

def add_stop
  station_list
  line_list
  puts "Enter station id:"
  station_id = gets.chomp.to_i
  puts "Enter line id:"
  line_id = gets.chomp.to_i
  new_stop = Stop.new(station_id, line_id)
  new_stop.save
  system 'clear'
end

def list_stops
  linespace
  puts "Stop ID : Line Name : Station "
  puts "------------------------------"
  stop_result = Stop.all
  stop_result.each do |stop|
    station_name = Station.lookup_by_id(stop.station_id).name
    line_name = Line.lookup_by_id(stop.line_id).name
    puts "#{stop.id}     #{line_name}       #{station_name}"
    puts "------------------------------"
  end
end

header
main_menu
