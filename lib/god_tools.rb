require 'rest_client'
require 'json'

module GodTools
  @api_base = 'http://godtoolsapi-stage-1291189452.us-east-1.elb.amazonaws.com/godtools-api/rest'
  @api_key = nil
  @interpreter = 1

  class << self
    attr_accessor :api_base, :api_key, :interpreter
  end

  def self.request(method: :get, url:, api_key: nil, params: {}, headers: {})
    request_api_key if api_key.nil?

    url = api_base + url

    case method.to_s.downcase.to_sym
    when :get, :head, :delete
      url += "#{ URI.parse(url).query ? '&' : '?' }#{ stringify_params(params) }" if params && params.any?
      payload = nil
    else
      payload = stringify_params(params)
    end

    request_opts = {
      headers: request_headers.update(headers),
      method: method,
      open_timeout: 30,
      payload: payload,
      url: url,
      timeout: 80
    }

    RestClient::Request.execute request_opts
  end

  def self.request_body(*args)
    JSON.parse request(*args).body
  end

  private

    def self.request_headers
      {
        authorization: @api_key,
        interpreter: @interpreter,
        accept: 'application/json'
      }
    end

    def self.request_api_key
      return @api_key unless @api_key.nil?
      response = request method: :post, url: '/auth', api_key: ''
      self.api_key = response.headers[:authorization]
    end

    def self.uri_escape(key)
      URI.escape key.to_s, Regexp.new("[^#{ URI::PATTERN::UNRESERVED }]")
    end

    def self.flatten_params(params, parent_key = nil)
      result = []
      params.each do |key, value|
        flatten_key = parent_key ? "#{ parent_key }[#{ uri_escape(key) }]" : uri_escape(key)
        result += value.is_a?(Hash) ? flatten_params(value, flatten_key) : [[flatten_key, value]]
      end
      result
    end

    def self.stringify_params(params)
      flatten_params(params).collect{ |key, value| "#{ key }=#{ uri_escape(value) }" }.join('&')
    end
end
