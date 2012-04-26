require 'actionwebservice'

class VerifyAddressResult < ActionWebService::Struct
  member :valid,  :bool
  member :errors, [ AddressError ]
end
