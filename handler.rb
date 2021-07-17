require_relative 'src/RequestInfos.rb'
require_relative 'src/DBUtils.rb'

require 'json'

def get_data(event:, context:)
  @request = RequestInfos.new
  @db_connection = DBUtils.new
  
  response_clients = @request.clientes_PCO('/investtools/clientesPCO?codPCO=&take=10&skip=0')

  response_clients["dados"].each do |client|
    # Usar o splat operator e reatribuir o objeto ao client com o nome tratado, sem os espacos laterais em branco

    new_item = {
      table_name: "clientes_pco",
      item: client
    }

    @db_connection.insert_table(new_item)
  end
end

def read_data(event:, context:)
  @db_connection = DBUtils.new

  condition = {
    table_name: "clientes_pco"
  }

  pp @db_connection.select_all(condition)
end
