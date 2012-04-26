class AddressServiceException < StandardError; end

class CepAddressService < ActionWebService::Base
  web_service_api CepAddressApi

  def cep_address(cep)
    address, errors = nil, []
    if cep.blank?
      errors << AddressError.new( :code => "40001",
                                  :description => "CEP deve ser preenchido")
    elsif !/\A\d{5}\-\d{3}\z/.match(cep)
      errors << AddressError.new( :code => "40002",
                                  :description => "CEP deve estar no formato XXXXX-XXX")
    elsif cep=="13083-852"
      errors << AddressError.new( :code => "40401",
                                  :description => "Nenhum resultado encontrado para o CEP #{cep}")
    else
      address = Address.new( :logradouro => "R. Albert Einstein",
                             :bairro => "Cidade Universitaria",
                             :localidade => "Campinas",
                             :uf => "SP",
                             :cep => cep)
    end

    CepAddressResult.new(
      :address => address,
      :errors => errors
    )
  end

end
