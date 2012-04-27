require 'actionwebservice'

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
    else
      if record = AddressRecord.find_by_cep(cep)
        address = Address.from_record(record)
      else
        errors << AddressError.new( :code => "40401",
                                    :description => "Nenhum resultado encontrado para o CEP #{cep}")
      end
    end

    CepAddressResult.new(
      :address => address,
      :errors => errors
    )
  end

end
