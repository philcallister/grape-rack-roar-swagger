require 'defaults'

module API
  module V1
    module Endpoints
      class Todos < Grape::API
        include API::V1::Defaults

        resource :todos do

          #####
          desc "Return a list of todos"
          params do
            optional :type, type: String, desc: "Use type 'all' to include todo items on the response"
          end
          get '/' , http_codes: [
            [200, 'Ok'],
            [400, "Bad Request"]
          ] do
            todos = Todo.all
            unless todos.nil?
              todos.extend(API::V1::Representers::TodosRepresenter)
              todos.to_hash(type: params[:type])
            end
          end

          # #####
          desc "Just a single todo"
          params do
            requires :id, type: Integer, desc: "The todo's unique id"
            optional :type, type: String, desc: "Use type 'all' to include todo items on the response"
          end
          get ':id', http_codes: [
            [200, "Ok"],
            [400, "Bad Request"],
            [404, "Not Found"]
          ] do
            todo = Todo.find(params[:id])
            unless todo.nil?
              todo.extend(API::V1::Representers::TodoRepresenter)
              todo.to_hash(type: params[:type])
            end
          end

          # #####
          desc "Return list of items for given todo"
          params do
            requires :id, type: Integer, desc: "The todo's unique id"
          end
          get ':id/items', http_codes: [
            [200, "Ok"],
            [400, "Bad Request"],
            [404, "Not Found"]
          ] do
            todo = Todo.find(params[:id])
            unless todo.nil?
              todo.extend(API::V1::Representers::TodoRepresenter)
              todo.to_hash
            end
          end

          # #####
          desc "Create a new todo"
          params do
            requires :title, type: String, desc: "The title for this todo"
            optional :description, type: String, desc: "The description for this todo"
          end
          post '/', http_codes: [
            [201, "Created"],
            [400, "Bad Request"],
            [404, "Not Found"]
          ] do
            todo = Todo.new
            todo.title = params[:title] if params[:title]
            todo.description = params[:description] if params[:description]
            todo.save 
            unless todo.nil?
              status 200
              todo.extend(API::V1::Representers::TodoRepresenter)
              todo.to_hash
            end
          end

          # #####
          desc "Delete an existing todo"
          params do
            requires :id, type: Integer, desc: "The todo's unique id"
          end
          delete ':id' do
            Todo.destroy(params[:id])
          end

        end
      end
    end
  end
end