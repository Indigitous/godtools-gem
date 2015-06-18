require 'httparty'
require 'hashie'

require 'god_tools/meta'
require 'god_tools/translations'

module GodTools

  include HTTParty
  base_uri 'http://godtoolsapi-stage-1291189452.us-east-1.elb.amazonaws.com/godtools-api/rest'
  headers 'interpreter' => '1', 'Accept' => 'application/json'

  def self.base_uri=(new_base_uri)
    base_uri new_base_uri
  end

  def self.authorization_key
    default_options[:headers]['Authorization']
  end

  def self.authorization_key=(new_authorization_key)
    return if new_authorization_key.nil?
    headers 'Authorization' => new_authorization_key
  end

  def self.request_authorization_key
    post('/auth').headers['authorization']
  end

  def self.request_authorization_key!
    self.authorization_key = self.request_authorization_key
  end

  %w(copy delete get head move options patch post put).each do |name|
    define_singleton_method name do |*args, &block|
      handle_response super(*args, &block)
    end
  end

  private

    def self.handle_response(response)
      case response.code
      when 200..299
        response
      else
        raise ResponseError.new response
      end
    end

  class ResponseError < HTTParty::ResponseError
    def to_s
      [super, "Response Code #{ response.code }", 'Response Body:', response.body].join "\n"
    end
  end

end
