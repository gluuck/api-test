class User < ApplicationRecord
  validates :name , presence: true
  validates :email , presence: true, uniqueness:  true
  validates :password , presence: true, length: {mininmum: 6}  
end
