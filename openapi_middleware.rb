class OpenApiMiddleware
  def initialize(app, base_path = '')
    @app = app
    @base_path = base_path
  end

  def call(env)
    if env['PATH_INFO'] == "#{@base_path}/openapi.json"
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