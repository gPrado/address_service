class AddressRecord < ActiveRecord::Base

  validates :cep, :presence => true,
                  :uniqueness => true,
                  :length => { :is => 9 },
                  :format => { :with => /\A\d{5}\-\d{3}\z/,
                               :message => 'must be in the format XXXXX-XXX' }
  validates :uf, :presence => true,
                 :length => { :is => 2 },
                 :format => { :with => /\A[a-zA-Z]{2}\z/,
                              :message => 'must be in the format XX' }
  validates :bairro, :presence => true,
                     :allow_blank => false
  validates :logradouro, :presence => true,
                         :allow_blank => false
  validates :localidade, :presence => true,
                         :allow_blank => false

  searchable :auto_index => true, :auto_remove => true do
    text :cep,        :boost => 5.0
    text :localidade, :boost => 2.0
    text :logradouro, :boost => 2.0
    text :bairro,     :boost => 2.0
    text :uf
  end

end
