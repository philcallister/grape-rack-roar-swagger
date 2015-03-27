require 'spec_helper'

describe API::Base do
  include Rack::Test::Methods
  def app
    API::Base
  end
  
  describe API::V1::Endpoints::Todos do
    describe "GET /v1/todos/:id" do
      it "returns a todo by id" do
        todo = Todo.create!(title: "Title 1", description: "Description 1")
        get "/v1/todos/#{todo.id}"
        expect(last_response.body).to eq({ id: todo.id, 
        	                               title: "Title 1",
        	                               description: "Description 1",
        	                               complete: false,
        	                               _links: {} }.to_json)
      end
    end
  end
end