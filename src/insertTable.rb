require_relative 'Movies.rb'
require 'json'

teste = Movies.new
file = File.read('../moviedata.json')
movies = JSON.parse(file)

# movies.each do | movie |
#   table_item = {
#     table_name: 'Movies',
#     item: movie
#   }
#   teste.insert_table(table_item)
# end

table_item = {
  table_name: "Movies",
  item: {
    title: "RandomMovie",
    year: 2021
  }
}

teste.insert_table(table_item)

# table_item_wrong = {
#   table_name: "Movies",
#   item: {
#     test: "TestItem"
#   }
# }
# teste.insert_table(table_item_wrong)