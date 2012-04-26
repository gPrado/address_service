class AddCepIndexToAddressRecords < ActiveRecord::Migration
  def change
  
    add_index :address_records, :cep, :unique => true
  
  end
end
