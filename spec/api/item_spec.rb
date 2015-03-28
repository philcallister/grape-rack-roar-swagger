require 'spec_helper'

describe API::Base do
  include Rack::Test::Methods
  def app
    API::Base
  end

  describe API::V1::Endpoints::Items do
    describe "GET /v1/todos/:id" do
      it "returns an item by id" do
        todo = Todo.create!(title: "Title 1", description: "Description 1")
        item = Item.create!(description: "Description 1", complete: true, todo: todo)
        get "/v1/items/#{item.id}"
        expect(last_response.body).to eq({ id: item.id,
                                           todo_id: todo.id,
                                           description: "Description 1",
                                           complete: true,
                                           _links: { self: {href: "/v1/items/#{item.id}"}}}.to_json)
      end
    end
  end
end
