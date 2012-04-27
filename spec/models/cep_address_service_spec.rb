require 'spec_helper'

describe CepAddressService do
  fixtures :address_records

  describe '#cep_address' do

    let(:service) { described_class.new }
    let(:existing_address) { address_records(:unicamp_record) }

    it 'verifies if cep is blank' do
      result = service.cep_address("")

      result.address.should be_nil
      result.errors.should_not be_empty
      error = result.errors.first
      error.code.should == "40001"
      error.description.should include("CEP")
    end

    it 'verifies if cep is formatted incorrectly' do
      result = service.cep_address("12345678")

      result.address.should be_nil
      result.errors.should_not be_empty
      error = result.errors.first
      error.code.should == "40002"
      error.description.should include("CEP")
    end

    it 'returns an error if the cep does not exist in the database' do
      result = service.cep_address("12345-678")

      result.address.should be_nil
      result.errors.should_not be_empty
      error = result.errors.first
      error.code.should == "40401"
      error.description.should include("CEP")
    end

    it 'returns the correct address if the cep exists' do
      result = service.cep_address(existing_address.cep)

      result.address.should be
      result.address.cep.should == existing_address.cep
      result.address.bairro.should == existing_address.bairro
      result.address.localidade.should == existing_address.localidade
      result.address.uf.should == existing_address.uf
      result.address.logradouro.should == existing_address.logradouro
      result.errors.should be_empty
    end

  end

end
