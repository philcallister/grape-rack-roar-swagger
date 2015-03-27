Dir.glob(File.join(File.dirname(__FILE__), '..', 'app', '**', '*'))
  .select { |f| File.directory? f }
  .each { |dir| $:.unshift(dir) }

Bundler.require :default, ENV['RACK_ENV']

require 'rubygems'
require 'bundler/setup'
require 'roar/representer'
require 'roar/json'
require 'roar/json/hal'

Dir[File.join(File.dirname(__FILE__), '..', 'app', 'api', 'v1', 'representers', '*.rb')].each { |f| require f }
Dir[File.join(File.dirname(__FILE__), '..', 'app', 'api', 'v1', 'endpoints', '*.rb')].each { |f| require f }
Dir[File.join(File.dirname(__FILE__), '..', 'app', 'api', 'v1', '**', '*.rb')].each { |f| require f }
Dir[File.join(File.dirname(__FILE__), '..', 'app', 'api', 'v2', '**', '*.rb')].each { |f| require f }
Dir[File.join(File.dirname(__FILE__), '..', 'app', 'api', '*.rb')].each { |f| require f }
Dir[File.join(File.dirname(__FILE__), '..', 'app', 'models', '*.rb')].each { |f| require f }
Dir[File.join(File.dirname(__FILE__), '..', 'app', '*.rb')].each { |f| require f }
