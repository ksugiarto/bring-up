class ContentsController < JSONAPI::ResourceController
  skip_before_action :verify_authenticity_token

  # Using JSONAPI-Resources, check on /app/resources/content_resource.rb
end
