$:.unshift File.dirname(__FILE__)
env = ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../application', __FILE__)
require 'active_support'
require 'erb'

module Application
  include ActiveSupport::Configurable
end

Application.configure do |config|
  config.root     = File.dirname(__FILE__)
  config.env      = ActiveSupport::StringInquirer.new(env.to_s)
end

db_config = YAML.load(ERB.new(File.read("db/config.yml")).result)[Application.config.env]
ActiveRecord::Base.default_timezone = :utc
ActiveRecord::Base.establish_connection(db_config)
