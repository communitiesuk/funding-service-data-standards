require 'govuk_tech_docs'
require_relative 'openapi_middleware'

GovukTechDocs.configure(self)

set :relative_links, true
activate :relative_assets

use OpenApiMiddleware