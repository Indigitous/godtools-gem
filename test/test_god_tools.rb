require 'test_helper'

class GodToolsTest < Minitest::Test

  def test_forwardable
    assert_respond_to GodTools, :authorization_key
    assert_respond_to GodTools, :authorization_key=
    assert_respond_to GodTools, :request_authorization_key
    assert_respond_to GodTools, :request_authorization_key!
    assert_respond_to GodTools, :base_uri
    assert_respond_to GodTools, :base_uri=
  end

end
