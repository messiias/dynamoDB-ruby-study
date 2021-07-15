require_relative 'Movies.rb'

table_definition = {
  table_name: 'Movies',
  key_schema: [
    {
      attribute_name: 'year',
      key_type: 'HASH'
    },
    {
      attribute_name: 'title',
      key_type: 'RANGE'
    }
  ],
  attribute_definitions: [
    {
      attribute_name: 'year',
      attribute_type: 'N'
    },
    {
      attribute_name: 'title',
      attribute_type: 'S'
    }
  ],
  provisioned_throughput: {
    read_capacity_units: 10,
    write_capacity_units: 10
  }
}

teste = MoviesClass.new
result = teste.create_table(table_definition)

puts result