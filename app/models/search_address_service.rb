class SearchAddressService < ActionWebService::Base
  web_service_api SearchAddressApi

  def search_address(query)
    addresses, errors = [], []
    if query.blank?
      errors << AddressError.new( :code => "40001",
                                  :description => "Busca deve ser preenchida")
    elsif query.include?("sindo")
      errors << AddressError.new( :code => "40402",
                                  :description => "Nenhum resultado encontrado para a busca por #{query}")
    else
      addresses = [ Address.new( :logradouro => "R. Buarque de Macedo",
                                 :bairro => query,
                                 :localidade => "Campinas",
                                 :uf => "SP",
                                 :cep => "13073-010"),
                    Address.new( :logradouro => "R. Albert Einstein",
                                 :bairro => query,
                                 :localidade => "Campinas",
                                 :uf => "SP",
                                 :cep => "13083-852")]
    end

    SearchAddressResult.new(
      :addresses => addresses,
      :errors => errors
    )
  end

end
