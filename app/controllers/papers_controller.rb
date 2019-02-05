class PapersController < JSONAPI::ResourceController
  skip_before_action :verify_authenticity_token

  # Using JSONAPI-Resources, check on /app/resources/paper_resource.rb
end
