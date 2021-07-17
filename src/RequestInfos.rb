require 'httparty'
require 'dotenv'

class RequestInfos
  include HTTParty
  include Dotenv
  Dotenv.load()

  base_uri 'https://apis-stg.vortx.com.br'
  format :json

  def initialize
    @authToken = "Bearer " + self.class.post('/vxlogin/api/user/AuthUserApi', {
      body: {
        token: ENV['TOKEN'],
        login: ENV['LOGIN']
      }.to_json,
      headers: {'Content-Type' => 'application/json'}
    }).parsed_response["tokenV2"]
  end

  def info_fundos(path, api_key)
    self.class.get(path, {
      headers: {
        "Authorization" => @authToken,
        "api-key" => api_key
      }
    }).parsed_response
  end

  def resgate_aplicacao(path)
    self.class.get(path, {
      headers: {
        "Authorization" => @authToken
      }
    }).parsed_response
  end

  def clientes_PCO(path)
    self.class.get(path, {
      headers: {
        "Authorization" => @authToken
      }
    })
  end
end

# rqInfos = RequestInfos.new
# pp rqInfos.info_fundos('/investtools/infoFundosInvesttools','3b68a539-d246-4ff5-b440-05670dd82717')[0]
# pp rqInfos.resgate_aplicacao('/investtools/resgateAplicacao?carteira=&dataFiltro=2021-01-01&take=10&skip=0')
# pp rqInfos.clientes_PCO('/investtools/clientesPCO?codPCO=&take=10&skip=0')