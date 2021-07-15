require_relative 'Movies.rb'
require 'json'

teste = Movies.new

table_item = {
  table_name: 'Movies',
  key: {
    title: "Buried",
    year: 2010
  }
}

result = teste.delete_one(table_item)
pp result