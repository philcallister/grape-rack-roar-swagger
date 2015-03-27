##
# Rack startup class
class App
  def self.instance
    @instance ||= Rack::Builder.new do
      use Rack::Cors do
        allow do
          origins '*'
          resource '*', headers: :any, methods: [:get, :post, :delete]
        end
      end
      run App.new
    end.to_app
  end

  def call(env)
    API::Base.call(env) # API
  end
end
