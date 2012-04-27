require 'spec_helper'

describe SearchAddressService do
  fixtures :address_records

  before(:all) do
    AddressRecord.index
  end

  describe '#search_address' do

    let(:service) { described_class.new }
    let(:existing_address) { address_records(:unicamp_record) }

    it 'verifies if search is blank' do
      result = service.search_address("")

      result.addresses.should be_empty
      result.errors.should_not be_empty
      error = result.errors.first
      error.code.should == "40001"
      error.description.should include("Busca")
    end

    it 'returns an error if the search results are empty' do
      result = service.search_address("12345-678")

      result.addresses.should be_empty
      result.errors.should_not be_empty
      error = result.errors.first
      error.code.should == "40402"
      error.description.should include("Nenhum")
    end

    it 'returns the found address when 1 keyword is given' do
      result = service.search_address("albert")

      result.addresses.should_not be_empty
      address = result.addresses.first
      address.cep.should == existing_address.cep
      address.bairro.should == existing_address.bairro
      address.localidade.should == existing_address.localidade
      address.uf.should == existing_address.uf
      address.logradouro.should == existing_address.logradouro
      result.errors.should be_empty
    end

    it 'returns the found address when multiple keywords are given' do
      result = service.search_address("albert capinas")

      result.addresses.should_not be_empty
      address = result.addresses.first
      address.cep.should == existing_address.cep
      address.bairro.should == existing_address.bairro
      address.localidade.should == existing_address.localidade
      address.uf.should == existing_address.uf
      address.logradouro.should == existing_address.logradouro
      result.errors.should be_empty
    end

  end

end
