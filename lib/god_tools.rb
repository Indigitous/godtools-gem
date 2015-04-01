require 'rest_client'
require 'json'

module GodTools
  @api_base = 'http://godtoolsapi-stage-1291189452.us-east-1.elb.amazonaws.com/godtools-api/rest/'

  class << self
    attr_accessor :api_base, :api_key, :interpreter
  end

  def self.request
  end
end
