module SabreDevStudio
  class Error < StandardError
    attr_reader :data
    def initialize(data)
      super(data)
    end
  end

  class BadRequest < Error                # 400
    def initialize(data)
      super("(#{data['type']}): #{data['message']}")
    end
  end
  class Unauthorized < Error; end         # 401
  class Forbidden < Error; end            # 403
  class NotFound < Error; end             # 404
  class NotAcceptable < Error; end        # 406
  class RateLimited < Error; end          # 429
  class InternalServerError < Error; end  # 500
  class ServiceUnavailable < Error; end   # 503
  class GatewayTimeout < Error; end       # 504
end
