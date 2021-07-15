require_relative 'Movies.rb'
require 'json'

teste = Movies.new

condition = {
  table_name: 'Movies',
  key: {
    title: "Buried",
    year: 2010
  }
}

result = teste.select_one(condition)

pp result

# result.each do |film| 
#     pp JSON.parse(film)
# end

# condition = {
#   table_name: 'Movies'
# }

# pp teste.select_all(condition)