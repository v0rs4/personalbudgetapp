RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers, :type => :controller
  # config.before(:example, :type => :controller) do
  #   @request.host = 'localhost'
  # end
end
