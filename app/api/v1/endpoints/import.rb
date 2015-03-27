require 'defaults'

module API
  module V1
    module Endpoints
      class Import < Grape::API
        include API::V1::Defaults

        resource :binary do

          #####
          desc "Import a binary file."
          params do
            requires :binary_file, type: Rack::Multipart::UploadedFile, desc: "Upload binary file format."
          end
          post '/' , http_codes: [
            [201, 'Created'],
            [400, "Bad Request"]
          ] do
            # puts params[:binary_file][:tempfile].read
            { filename: params[:binary_file][:filename],
              size: params[:binary_file][:tempfile].size }
          end

        end
      end
    end
  end
end