module API
  module V1
    module Representers
      module TodosRepresenter
        include Roar::JSON::HAL
        include Roar::Hypermedia

        collection :to_a, :extend => API::V1::Representers::TodoRepresenter, as: :todos, embedded: false
      end
    end
  end
end