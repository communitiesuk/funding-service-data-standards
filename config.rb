require 'govuk_tech_docs'
require_relative 'openapi_middleware'
require 'fileutils'


GovukTechDocs.configure(self)

set :relative_links, true
activate :relative_assets

# Determine the base path based on the environment variable
base_path = ENV['BASE_PATH'] || ''

use OpenApiMiddleware, base_path

# Copy openapi.json to the build directory after the build process so that it can be exposed for use with SwaggerEditor online
after_build do |builder|
  src = File.join(root, './openapi/openapi.json')
  dst = File.join(root, config[:build_dir], 'openapi', 'openapi.json')
  puts "Copying #{src} to #{dst}"  # Debug statement
  puts "BUILDIR #{config[:build_dir]}"
  FileUtils.mkdir_p(File.dirname(dst))  # Ensure the destination directory exists
  FileUtils.cp(src, dst)  # Copy the file
end