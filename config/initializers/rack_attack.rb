class Rack::Attack

  ### Configure Cache ###

  # If you don't want to use Rails.cache (Rack::Attack's default), then
  # configure it here.
  #
  # Note: The store is only used for throttling (not blocklisting and
  # safelisting). It must implement .increment and .write like
  # ActiveSupport::Cache::Store

  # Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  ### Throttle Spammy Clients ###

  # If any single client IP is making tons of requests, then they're
  # probably malicious or a poorly-configured scraper. Either way, they
  # don't deserve to hog all of the app server's CPU. Cut them off!
  #
  # Note: If you're serving assets through rack, those requests may be
  # counted by rack-attack and this throttle may be activated too
  # quickly. If so, enable the condition to exclude them from tracking.

  # Throttle all requests by IP (60rpm)
  #
  # Key: "rack::attack:#{Time.now.to_i/:period}:req/ip:#{req.ip}"
  throttle('api books and collections', limit: 5, period: 20.seconds) do |req|
    critical_paths = [
      '/api/books',
      '/api/collections'
    ]
    if critical_paths.include?(req.path) && req.post?
      req.ip
    end
  end

  ### Custom Throttle Response ###

# By default, Rack::Attack returns an HTTP 429 for throttled responses,
# which is just fine.
#
# If you want to return 503 so that the attacker might be fooled into
# believing that they've successfully broken your app (or you just want to
# customize the response), then uncomment these lines.

  self.throttled_response = lambda do |env|
    # status, headers, body
    [ 503, {}, ['Server Error']]
  end
end
