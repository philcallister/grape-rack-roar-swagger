module API
  module V1
    module Representers
      module TodoRepresenter
        include Roar::JSON::HAL
        include Roar::Hypermedia

        property :id, type: 'Integer', desc: "Todo's unique id"
        property :title, type: 'String', desc: 'Todo title name.'
        property :description, type: 'String', desc: 'Todo description information.'
        property :complete, type: 'String', desc: 'Is this todo complete?'

        collection :items, :extend => API::V1::Representers::ItemRepresenter, embedded: true, if:
          lambda { |options| options[:type] == 'all' } 

        link :self do
          # employee_url(self.id)
        end
      end
    end
  end 
end