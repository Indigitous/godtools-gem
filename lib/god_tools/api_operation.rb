module GodTools
  class ApiOperation
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
      headers 'Authorization' => new_authorization_key
    end

    def self.request_authorization_key
      post('/auth').headers['authorization']
    end

    def self.request_authorization_key!
      self.authorization_key = self.request_authorization_key
    end

  end
end
