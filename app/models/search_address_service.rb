require 'actionwebservice'

class SearchAddressService < ActionWebService::Base
  web_service_api SearchAddressApi

  def search_address(query)
    addresses, errors = [], []
    if query.blank?
      errors << AddressError.new( :code => "40001",
                                  :description => "Busca deve ser preenchida")
    else
      records = AddressRecord.search { fulltext(query, :minimum_match => 1) }.results

      if records.empty?
        errors << AddressError.new( :code => "40402",
                                    :description => "Nenhum resultado encontrado para a busca por #{query}")
      else
        addresses = records.map { |record| Address.from_record(record) }
      end
    end

    SearchAddressResult.new(
      :addresses => addresses,
      :errors => errors
    )
  end

end
