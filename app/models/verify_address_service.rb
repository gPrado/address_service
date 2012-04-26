class VerifyAddressService < ActionWebService::Base
  web_service_api VerifyAddressApi

  def verify_address(address)
    errors = []
    unless /\A\d{5}\-\d{3}\z/.match(address.cep)
      errors << AddressError.new( :code => "40002",
                                  :description => "CEP deve estar no formato XXXXX-XXX")
    end
    unless /\A[a-zA-z]{2}\z/.match(address.uf)
      errors << AddressError.new( :code => "40002",
                                  :description => "UF deve estar no formato XX")
    end
    if address.logradouro.blank?
      errors << AddressError.new( :code => "40001",
                                  :description => "Logradouro deve ser preenchido")
    end
    if address.localidade.blank?
      errors << AddressError.new( :code => "40001",
                                  :description => "Localidade deve ser preenchido")
    end
    if address.bairro.blank?
      errors << AddressError.new( :code => "40001",
                                  :description => "Bairro deve ser preenchido")
    end

    VerifyAddressResult.new(
      :valid => errors.empty?,
      :errors => errors
    )
  end

end
