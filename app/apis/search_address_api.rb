class SearchAddressApi < ActionWebService::API::Base
  api_method :search_address,
             :expects => [ :query => :string ],
             :returns => [ SearchAddressResult ]

end
