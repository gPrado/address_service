class VerifyAddressApi < ActionWebService::API::Base
  api_method :verify_address,
             :expects => [ :address => Address ],
             :returns => [ VerifyAddressResult ]

end
