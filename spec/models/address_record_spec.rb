require 'spec_helper'

describe AddressRecord do
  fixtures :address_records

  context "validations" do
    let(:record) { address_records(:unicamp_record) }

    it 'is not valid when all attributes are blank' do
      described_class.new.should_not be_valid
    end

    it 'is not valid when cep is blank' do
      record.cep = ""
      record.should_not be_valid
    end

    it 'is not valid when cep is formatted incorrectly' do
      record.cep = "13083 852"
      record.should_not be_valid
    end

    it 'is not valid when cep has the wrong size' do
      record.cep = "13083-8520"
      record.should_not be_valid
    end

    it 'is not valid when uf is blank' do
      record.uf = ""
      record.should_not be_valid
    end

    it 'is not valid when uf is formatted incorrectly' do
      record.uf = "sao paulo"
      record.should_not be_valid
    end

    it 'is not valid when uf has the wrong size' do
      record.uf = "spp"
      record.should_not be_valid
    end

    it 'is not valid when bairro is blank' do
      record.bairro = ""
      record.should_not be_valid
    end

    it 'is not valid when logradouro is blank' do
      record.logradouro = ""
      record.should_not be_valid
    end

    it 'is not valid when localidade is blank' do
      record.localidade = ""
      record.should_not be_valid
    end

    it 'does not allow duplicated ceps' do
      clone = described_class.new(
                :cep => record.cep,
                :logradouro => record.logradouro + "2",
                :bairro => record.bairro + "2",
                :localidade => record.localidade + "2",
                :uf => "rj"
              )
      expect{ clone.save! }.
        to raise_error(ActiveRecord::RecordInvalid)
    end

  end

end
