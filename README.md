# HeartbeatMiddleware

A Rack middleware that reads the git rev-parse HEAD SHA1 signature and outputs it as json with a timestamp.

## Installation

Add this line to your application's Gemfile:

    gem 'heartbeat_middleware', :git => 'git@github.com:joelbaril/heartbeat_middleware.git'

And then execute:

    $ bundle

## Usage

		This middleware should start automatically when the gem is included in a project for Rails apps. For other apps, the root path of the project has to be specified when initializing HeartbeatMiddleware
		You can add /heartbeat to the URL and the Rack endpoint will return the sha1 and updated_at information in a JSON.
