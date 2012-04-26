require 'actionwebservice'

class SearchAddressResult < ActionWebService::Struct
  member :addresses, [ Address ]
  member :errors,    [ AddressError ]
end
