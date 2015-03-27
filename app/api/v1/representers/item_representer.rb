module API
  module V1
    module Representers
      module ItemRepresenter
        include Roar::JSON::HAL
        include Roar::Hypermedia

        property :id, type: 'Integer', desc: "Item's unique id"
        property :todo_id, type: 'Integer', desc: "Todo's unique id"
        property :description, type: 'String', desc: 'Item description information.'
        property :complete, type: 'String', desc: 'Is this item complete?'

        link :self do
          # employee_url(self.id)
        end
      end
    end
  end 
end