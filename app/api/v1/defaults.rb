module API
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do

        # common Grape settings
        version 'v1' # path-based versioning by default
        format :json # only json here...no XML

        # Global handler for simple not found case
        rescue_from ActiveRecord::RecordNotFound do |e|
          error_response(message: e.message, status: 404)
        end

        rescue_from Grape::Exceptions::ValidationErrors do |e|
          rack_response e.to_json, 400
        end

        # Global exception handler, used for error notifications
        rescue_from :all do |e|
          if ENV['RACK_ENV'] == 'development'
            raise e
          else
            # Error handling...
            # Airbrake, Raven, etc...
          end
        end

        # Placeholder for authentication -- Warden, Devise, etc...
        before do
          # error!('Unauthorized', 401) unless headers['Authorization'] == "some token"
        end

      end
    end
  end
end