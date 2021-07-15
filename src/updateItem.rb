require_relative 'Movies.rb'
require 'json'

teste = Movies.new

table_item = {
    table_name: 'Movies',
    key:{
        title: "Buried",
        year: 2010
    },
    update_expression: 'SET info.actors = :y',
    expression_attribute_values: {
        ':y': ['teste1', 'teste2', 'teste3']
    },
    return_values: 'UPDATED_NEW'
}


response = teste.update_item(table_item)
pp response