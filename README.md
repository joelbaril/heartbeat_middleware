# HeartbeatMiddleware

Heartbeat Rack middleware to be used in to get the sha1 of a running Rails and Sinatra app, along with the date of the last commit on the branch.

## Installation

Add this line to your application's Gemfile:

    gem 'heartbeat_middleware'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install heartbeat_middleware

## Usage

		This middleware should start automatically when the gem is included in a project.
		In a Rails app,  you can add /heartbeat to the URL and the Rack endpoint will return the sha1 and updated_at information in a JSON.
		It is also possible to specify the absolute path to the root of the app, eg: 127.0.0.1:3000/heartbeat?root=/home/user/rail_app/
