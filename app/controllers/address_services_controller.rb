require 'actionwebservice'

class AddressServicesController < ApplicationController
  acts_as_web_service

  wsdl_service_name 'AddressService'
  wsdl_namespace 'urn:AddressService'

  web_service_dispatching_mode :delegated

  web_service :cep_address,    CepAddressService.new
  web_service :search_address, SearchAddressService.new
  web_service :verify_address, VerifyAddressService.new

  web_service_scaffold :invoke

  def log_error(message)
    Rails.logger.error(message)
  end

end
