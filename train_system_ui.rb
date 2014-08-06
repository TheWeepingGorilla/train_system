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
    puts "S > Add or view stations."
    puts "L > Add or view lines."
    puts "    "
    puts "X > Exit."
    linespace
    main_choice = gets.chomp.upcase
    if main_choice == "S"
      station_stuff
    elsif main_choice == "L"
      line_stuff
    elsif main_choice == "X"
      puts "OK.  Have a good one."
      linespace
      exit
    else
      system 'clear'
      puts "Invalid! Try again"
    end
  end
end

def station_stuff
end

def line_stuff
end

header
main_menu
