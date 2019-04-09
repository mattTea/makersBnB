ENV['RACK_ENV'] = 'test'

require_relative 'setup_test_database'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara/rspec'
require 'rubocop'
# require_relative './setup_test_database'

Capybara.app = PinkBnB

# RSpec.configure do |config|
#   config.before(:each) do
#     setup_test_database
#   end
# end

RSpec.configure do |config|
  config.before(:each) do |config|
    setup_test_database
  end
  config.include Capybara::DSL
  config.after(:suite) do
    # puts
    # puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    # puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
