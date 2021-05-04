require 'rails_helper'

RSpec.describe Api::V1::UsersController , type: :controller do 
	let!(:user){User.new}
	
	
  describe 'GET #index'do
  	    it{ expect render_template :index}
  end
  describe 'POST #login' do

    it { expect render_template :login }
  end

end