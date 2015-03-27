require 'defaults'

module API
  module V1
    module Endpoints
      class Items < Grape::API
        include API::V1::Defaults

        resource :items do
          desc 'Just a single item'
          params do
            requires :id, type: Integer, desc: "The items's unique id"
          end
          get ':id' do
            item = Item.find(params[:id])
            unless item.nil?
              item.extend(API::V1::Representers::ItemRepresenter)
              item.to_hash
            end
          end
        end

      end
    end
  end
end