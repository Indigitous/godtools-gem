require 'minitest/autorun'
require 'minitest/pride'
require 'webmock/minitest'
WebMock.disable_net_connect! allow_localhost: true
require 'god_tools'

def webmock_response_file(name)
  File.new File.expand_path("../webmock_response_files/#{ name }.txt", __FILE__)
end

class MiniTest::Test
  def before_setup
    super

    stub_request(:post, "#{ GodTools.base_uri }/auth").to_return webmock_response_file('auth')
    stub_request(:get, "#{ GodTools.base_uri }/meta").to_return webmock_response_file('meta')
    stub_request(:get, "#{ GodTools.base_uri }/v2/meta").to_return webmock_response_file('v2/meta_redirect')
    stub_request(:get, 'https://s3.amazonaws.com/cru-godtools/meta/all.json').to_return webmock_response_file('v2/meta_response')
    stub_request(:get, "#{ GodTools.base_uri }/translations/en/kgp/config").to_return webmock_response_file('translations_en_kgp_config')
    stub_request(:get, "#{ GodTools.base_uri }/translations/en/kgp/pages/a348a98b-77b1-4542-931c-c1af41bd206e").to_return webmock_response_file('translations_en_kgp_pages')

    GodTools.base_uri = 'http://godtoolsapi-stage-1291189452.us-east-1.elb.amazonaws.com/godtools-api/rest'
    GodTools.request_authorization_key! if GodTools.authorization_key.nil?
  end
end

