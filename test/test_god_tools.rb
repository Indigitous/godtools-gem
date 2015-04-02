require 'test_helper'

class GodToolsTest < Minitest::Test
  def test_it_will_request_api_key
    GodTools.api_key = nil
    assert_nil GodTools.api_key
    begin
      GodTools.request url: ''
    rescue RestClient::ResourceNotFound
    else
      raise
    end
    assert_equal GodTools.api_key, '13cd25519b7996c8a4aabaf12aa62aa644094960'
  end

  def test_get_request
    result = GodTools.request method: :get, url: '/meta', params: { first_param: '1st', second_param: '2nd' }
    assert_equal result.request.url, 'http://godtoolsapi-stage-1291189452.us-east-1.elb.amazonaws.com/godtools-api/rest/meta?first_param=1st&second_param=2nd'
    assert_equal result.request.method, :get
    assert_nil result.request.payload
  end

  def test_request_headers
    result = GodTools.request method: :get, url: '/meta', params: { first_param: '1st', second_param: '2nd' }
    assert_equal result.request.headers[:authorization], '13cd25519b7996c8a4aabaf12aa62aa644094960'
    assert_equal result.request.headers[:interpreter], 1
    assert_equal result.request.headers[:accept], 'application/json'
  end

  def test_post_request
    result = GodTools.request method: :post, url: '/auth', params: { first_param: '1st', second_param: '2nd' }
    assert_equal result.request.url, 'http://godtoolsapi-stage-1291189452.us-east-1.elb.amazonaws.com/godtools-api/rest/auth'
    assert_equal result.request.method, :post
    assert_instance_of RestClient::Payload::Base, result.request.payload
  end

  def test_request_body
    result = GodTools.request_body method: :get, url: '/meta', params: { first_param: '1st', second_param: '2nd' }
    assert_instance_of Hash, result
    assert_equal result['languages'].size, 26
  end
end
