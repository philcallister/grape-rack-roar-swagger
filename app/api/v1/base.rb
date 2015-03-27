require 'endpoints/todos'
require 'endpoints/items'
require 'endpoints/import'

module API
  module V1
    class Base < Grape::API
      mount API::V1::Endpoints::Todos
      mount API::V1::Endpoints::Items
      mount API::V1::Endpoints::Import
    end
  end
end