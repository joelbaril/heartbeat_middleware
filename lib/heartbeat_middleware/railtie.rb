module HeartbeatMiddleware
	class Railtie < Rails::Railtie
		initializer "heartbeat_middleware.insert_middleware" do |app|
			app.middleware.use HeartbeatMiddleware::Heartbeat
		end
	end
end