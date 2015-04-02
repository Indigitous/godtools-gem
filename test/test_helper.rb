require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require 'webmock/minitest'
WebMock.disable_net_connect! allow_localhost: true
require 'god_tools'

def webmock_response_file(name)
  File.new File.expand_path("../webmock_response_files/#{ name }.txt", __FILE__)
end

class MiniTest::Test
  def before_setup
    super

    stub_request(:post, "#{ GodTools.api_base }/auth").to_return webmock_response_file('auth')

    stub_request(:get, "#{ GodTools.api_base }").to_return webmock_response_file('root')
    stub_request(:get, /#{ GodTools.api_base }\?.*/).to_return webmock_response_file('root')

    stub_request(:get, /#{ GodTools.api_base }\/meta\?.*/).to_return webmock_response_file('meta')
  end
end
