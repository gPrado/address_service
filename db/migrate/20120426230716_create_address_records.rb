class CreateAddressRecords < ActiveRecord::Migration
  def change
    create_table :address_records do |t|
      t.string :cep,        :null => false
      t.string :logradouro, :null => false
      t.string :uf,         :null => false
      t.string :bairro,     :null => false
      t.string :localidade, :null => false

      t.timestamps
    end
  end
end
