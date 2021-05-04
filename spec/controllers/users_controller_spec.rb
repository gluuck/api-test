require 'rails_helper'

RSpec.describe Api::V1::UsersController , type: :controller do 
	let!(:user){User.new}
	#let!(:users){create_list :user, 5}
	before {get :index}
  describe 'GET #index'do
    it "assigns @users" do         
      expect(user.).to  
    end
  end
  
end