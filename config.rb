require 'govuk_tech_docs'
require_relative 'openapi_middleware'

GovukTechDocs.configure(self)

use OpenApiMiddleware