# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Bt9::Application.initialize!
# hack to fix cloudinary error https://github.com/archiloque/rest-client/issues/141
class Hash
  remove_method :read
rescue
end
