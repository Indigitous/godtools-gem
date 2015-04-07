require 'test_helper'

module GodTools
  class TestMeta < Minitest::Test

    def test_all
      all = GodTools::Meta.all
      assert_kind_of Hashie::Mash, all
      assert_kind_of Array, all.languages
      assert_equal 26, all.languages.size
      assert_equal 'satisfied', all.languages.first.packages.first.code
    end

  end
end
