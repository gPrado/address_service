require 'actionwebservice'

class Address < ActionWebService::Struct
  member :logradouro, :string
  member :bairro,     :string
  member :localidade, :string
  member :uf,         :string
  member :cep,        :string
end
