require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
	subject { FactoryBot.build( :user ) }
	before { get :index }
	describe 'GET #index' do
	end
end
