require 'httparty'
require 'hashie'
require 'forwardable'

require 'god_tools/api_operation'
require 'god_tools/meta'
require 'god_tools/translations'

module GodTools
  class << self
    extend Forwardable
    def_delegators ApiOperation, :authorization_key, :authorization_key=, :request_authorization_key, :request_authorization_key!, :base_uri, :base_uri=
  end
end
