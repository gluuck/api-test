# frozen_string_literal: true

require 'spec_helper'
require 'factory_bot_rails'
ENV[ 'RAILS_ENV' ] ||= 'test'
require File.expand_path( '../config/environment', __dir__ )
abort( 'The Rails environment is running in production mode!' ) if Rails.env.production?
require 'rspec/rails'
begin
	ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => error
	puts error.to_s.strip
	exit 1
end
RSpec.configure do | config |
	config.fixture_path = "#{ ::Rails.root }/spec/fixtures"
	config.include FactoryBot::Syntax::Methods
	config.use_transactional_fixtures = true
	config.infer_spec_type_from_file_location!
	config.filter_rails_from_backtrace!
end
