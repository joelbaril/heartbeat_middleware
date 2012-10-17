# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'heartbeat_middleware/version'

Gem::Specification.new do |gem|
  gem.name          = "heartbeat_middleware"
  gem.version       = HeartbeatMiddleware::VERSION
  gem.authors       = ["Joel Baril"]
  gem.email         = ["joel.baril@gmail.com"]
  gem.description   = %q{Heartbeat Rack middleware to be used in to get the sha1 of a running Rails and Sinatra app, along with the date of the last commit on the branch.}
  gem.summary       = %q{Heartbeat Rack middleware for Rails and Sinatra apps}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
