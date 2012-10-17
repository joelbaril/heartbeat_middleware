# HeartbeatMiddleware

A middleware that reads the git rev-parse HEAD SHA1 signature and outputs it as json with a timestamp.

## Installation

Add this line to your application's Gemfile:

    gem 'heartbeat_middleware', :git => 'git@github.com:joelbaril/heartbeat_middleware.git'

And then execute:

    $ bundle

## Usage

		This middleware should start automatically when the gem is included in a project.
		In a Rails app,  you can add /heartbeat to the URL and the Rack endpoint will return the sha1 and updated_at information in a JSON.
		It is also possible to specify the absolute path to the root of the app, eg: 127.0.0.1:3000/heartbeat?root=/rail_app/
