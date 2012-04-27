require 'spec_helper'

describe Address do

  fixtures :address_records

  describe '.from_record' do
    it 'loads all attributes correctly' do
      record = address_records(:unicamp_record)
      address = described_class.from_record(record)

      address.cep.should        == record.cep
      address.logradouro.should == record.logradouro
      address.uf.should         == record.uf
      address.bairro.should     == record.bairro
      address.localidade.should == record.localidade
    end
  end

end

