# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
	subject { FactoryBot.build( :user ) }
	it { expect( subject ).to be_valid }
end
