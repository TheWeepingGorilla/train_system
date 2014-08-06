require 'pg'
require 'pry'
require 'lines'
require 'stations'
require 'stops'

DB = PG.connect({:dbname => 'train_system'})

