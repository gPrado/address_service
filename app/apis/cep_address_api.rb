require 'actionwebservice'

class CepAddressApi < ActionWebService::API::Base
  api_method :cep_address,
             :expects => [ :cep => :string ],
             :returns => [ CepAddressResult ]

end
