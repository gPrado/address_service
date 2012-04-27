require 'actionwebservice'

class Address < ActionWebService::Struct
  member :logradouro, :string
  member :bairro,     :string
  member :localidade, :string
  member :uf,         :string
  member :cep,        :string

  class << self

    def from_record(record)
      new(
        :logradouro => record.logradouro,
        :bairro     => record.bairro,
        :localidade => record.localidade,
        :uf         => record.uf,
        :cep        => record.cep)
    end

  end
end
