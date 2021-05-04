require 'rails_helper'

RSpec.describe User , type: :model do
  it 'should not empty' do
  user=User.new(name: 'Vasya',email:'vasya@gmail.com',password:'123123')  
  expect(user).to be_valid  
  end  
end
