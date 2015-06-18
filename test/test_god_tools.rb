require 'test_helper'

class GodToolsTest < Minitest::Test

  def test_default_headers
    assert_equal 'application/json', GodTools.default_options[:headers]['Accept']
    assert_equal '1', GodTools.default_options[:headers]['interpreter']
  end

  def test_base_uri
    original_uri = GodTools.base_uri
    GodTools.base_uri = 'yoyo/yo'
    assert_equal 'http://yoyo/yo', GodTools.base_uri
    GodTools.base_uri = original_uri
  end

  def test_authorization_key
    original_auth_key = GodTools.authorization_key
    GodTools.authorization_key = 'abc123'
    assert_equal 'abc123', GodTools.authorization_key
    GodTools.authorization_key = original_auth_key
    assert_equal original_auth_key, GodTools.authorization_key
  end

  def test_request_authorization_key
    assert_equal '13cd25519b7996c8a4aabaf12aa62aa644094960', GodTools.request_authorization_key
  end

  def test_request_authorization_key!
    GodTools.request_authorization_key!
    assert_equal '13cd25519b7996c8a4aabaf12aa62aa644094960', GodTools.authorization_key
  end

  def test_successful_request
    %w(copy delete get head move options patch post put).each do |name|
      request_stub = stub_request(name.to_sym, "#{ GodTools.base_uri }/").
        with(headers: { 'Accept' => 'application/json', 'Authorization' => GodTools.authorization_key, 'Interpreter' => '1' }).
        to_return(status: 200, body: '', headers: {})
      assert_equal 200, GodTools.send(name, '/').code
      assert_requested request_stub
      remove_request_stub request_stub
    end
  end

  def test_unsuccessful_request
    %w(copy delete get head move options patch post put).each do |name|
      request_stub = stub_request(name.to_sym, "#{ GodTools.base_uri }/").
        with(headers: { 'Accept' => 'application/json', 'Authorization' => GodTools.authorization_key, 'Interpreter' => '1' }).
        to_return(status: 500, body: '', headers: {})
      assert_raises GodTools::ResponseError do
        GodTools.send(name, '/')
      end
      assert_requested request_stub
      remove_request_stub request_stub
    end
  end

end
