require 'spec_helper'

describe VerifyAddressService do
  fixtures :address_records

  describe "#verify_address" do

    let(:service) { described_class.new }
    let(:valid_address) { Address.from_record address_records(:unicamp_record) }

    it 'verifies a valid address' do
      result = service.verify_address(valid_address)

      result.valid.should be_true
      result.errors.should be_empty
    end

    it 'verifies cep' do
      invalid_address = valid_address
      invalid_address.cep = "invalid"

      result = service.verify_address(invalid_address)

      result.valid.should be_false
      result.errors.should_not be_empty
      error = result.errors.first
      error.code.should == "40002"
      error.description.should include("CEP")
    end

    it 'verifies uf' do
      invalid_address = valid_address
      invalid_address.uf = "invalid"

      result = service.verify_address(invalid_address)

      result.valid.should be_false
      result.errors.should_not be_empty
      error = result.errors.first
      error.code.should == "40002"
      error.description.should include("UF")
    end

    it 'verifies logradouro' do
      invalid_address = valid_address
      invalid_address.logradouro = ""

      result = service.verify_address(invalid_address)

      result.valid.should be_false
      result.errors.should_not be_empty
      error = result.errors.first
      error.code.should == "40001"
      error.description.should include("Logradouro")
    end

    it 'verifies localidade' do
      invalid_address = valid_address
      invalid_address.localidade = ""

      result = service.verify_address(invalid_address)

      result.valid.should be_false
      result.errors.should_not be_empty
      error = result.errors.first
      error.code.should == "40001"
      error.description.should include("Localidade")
    end

    it 'verifies bairro' do
      invalid_address = valid_address
      invalid_address.bairro = ""

      result = service.verify_address(invalid_address)

      result.valid.should be_false
      result.errors.should_not be_empty
      error = result.errors.first
      error.code.should == "40001"
      error.description.should include("Bairro")
    end
 
  end

end
