class Personal < ActiveRecord::Base
  attr_accessible :address, :age, :name, :phone_number
  validates :name , presence: true , length: { minimum: 1 , maximum: 50 }
  validates :age , presence: true
end
