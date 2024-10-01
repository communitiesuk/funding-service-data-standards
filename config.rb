require 'govuk_tech_docs'
require_relative 'openapi_middleware'

GovukTechDocs.configure(self)

set :relative_links, true
activate :relative_assets

# Determine the base path based on the environment variable
base_path = ENV['BASE_PATH'] || ''

use OpenApiMiddleware, base_path