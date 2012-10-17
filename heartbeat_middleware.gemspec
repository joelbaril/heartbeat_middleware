# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'heartbeat_middleware/version'

Gem::Specification.new do |gem|
  gem.name          = "heartbeat_middleware"
  gem.version       = HeartbeatMiddleware::VERSION
  gem.authors       = ["Joel Baril"]
  gem.email         = ["joel.baril@gmail.com"]
  gem.description   = %q{A middleware that reads the git rev-parse HEAD SHA1 signature and outputs it as json with a timestamp.}
  gem.summary       = %q{Heartbeat Rack middleware for Rails and Sinatra apps}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
