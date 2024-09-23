class OpenApiMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    if env['PATH_INFO'] == '/openapi.json'
      serve_openapi_json
    else
      @app.call(env)
    end
  end

  private

  def serve_openapi_json
    file_path = File.expand_path('../openapi/openapi.json', __FILE__)
    if File.exist?(file_path)
      [200, { 'Content-Type' => 'application/json' }, [File.read(file_path)]]
    else
      [404, { 'Content-Type' => 'text/plain' }, ['File not found']]
    end
  end
end