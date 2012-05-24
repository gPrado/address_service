# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AddressRecord.create([
  {
    :cep        => "58407-035",
    :localidade => "Campina Grande",
    :logradouro => "Rua Sindolfo Montenegro",
    :bairro     => "Monte Castelo",
    :uf         => "PB"
  },
  {
    :cep        => "06050-210",
    :localidade => "Osasco",
    :logradouro => "Avenida Salvador Sindonia",
    :bairro     => "Jaguaribe",
    :uf         => "SP"
  },
  {
    :cep        => "58078-180",
    :localidade => "João Pessoa",
    :logradouro => "Rua Sindolfo Gonçalves Chaves",
    :bairro     => "Funcionários",
    :uf         => "PB"
  },
  {
    :cep        => "68907-410",
    :localidade => "Macapá",
    :logradouro => "Alameda Corito",
    :bairro     => "Renascer",
    :uf         => "AP"
  },
  {
    :cep        => "13083-852",
    :localidade => "Campinas",
    :logradouro => "Avenida Albert Einstein",
    :bairro     => "Cidade Universitária",
    :uf         => "SP"
  },
  {
    :cep        => "13083-755",
    :localidade => "Campinas",
    :logradouro => "Rua Antônio Augusto de Almeida",
    :bairro     => "Cidade Universitária",
    :uf         => "SP"
  },
  {
    :cep        => "70910-900",
    :localidade => "Brasília",
    :logradouro => "Universidade de Brasília (UnB)",
    :bairro     => "Asa Norte",
    :uf         => "DF"
  },
  {
    :cep        => "70710-905",
    :localidade => "Brasília",
    :logradouro => "Hospital Regional da Asa Norte",
    :bairro     => "Asa Norte",
    :uf         => "DF"
  }
])
