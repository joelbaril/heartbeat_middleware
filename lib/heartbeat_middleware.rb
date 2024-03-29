require "heartbeat_middleware/version"
require 'heartbeat_middleware/railtie' if defined?(Rails)

require 'json'

module HeartbeatMiddleware
  class Heartbeat

    ROOT_PARAM_NAME = "root"
    ENDPOINT_PATH   = "/heartbeat"
    ERROR_MESSAGE   = "cannot get system status"

    def initialize(app, opts = {}) 
      @root = opts[:root_path]
      @app  = app
    end

    def call(env)
      if env['PATH_INFO'] == ENDPOINT_PATH && !@root.nil?
        sha1        = get_sha1(@root)
        last_update = get_last_update(sha1)
        response    = generate_response(sha1, last_update)
        [200, {"Content-Type" => "text"}, [JSON.pretty_generate(response)]]
      else
        @app.call(env)
      end
    end

    protected
    # Return the sha1 from git for the specified path. 
    # Return an empty string if invalid path or invalid git repository.
    def get_sha1(path)
      return @cache_sha1 unless @cache_sha1.nil?
      sha1 = ""
      if File.exist?(path)
        Dir.chdir(path) do
          sha1 = %x(git rev-parse HEAD).delete("\n")
        end
      end

      @cache_sha1 = sha1
      sha1
    end

    def get_last_update(sha1)
      return @cache_last_update unless @cache_last_update.nil?
      last_update = %x(git log -1 --format="%ci" #{sha1}).delete("\n")
      @cache_last_update = last_update
      last_update
    end

    # Generate the appropriate JSON 
    def generate_response(sha1, last_update)
      if sha1.empty?
        response = {:error => ERROR_MESSAGE}
      else
        response = {:code => {:sha1 => "#{sha1}",:updated_at => "#{last_update}"}}
      end
      response
    end
  end
end