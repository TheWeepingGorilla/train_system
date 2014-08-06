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
  results = Station.all
  results.each do |result|
    puts result.name
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
  results = Line.all
  results.each do |line|
    puts line.name
  end
end

header
main_menu
