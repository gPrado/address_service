class CepAddressResult < ActionWebService::Struct
  member :address,  Address
  member :errors, [ AddressError ]
end
