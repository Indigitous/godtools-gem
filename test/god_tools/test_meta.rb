require 'test_helper'

module GodTools
  class TestMeta < Minitest::Test

    def test_all_languages
      all_languages = GodTools::Meta.all_languages
      assert_kind_of Array, all_languages
      assert_equal 26, all_languages.size
      assert_equal 'satisfied', all_languages.first.packages.first.code
      all_languages.each do |language|
        assert_kind_of GodTools::Meta::Language, language
      end
    end

    def test_language_package_by_status
      language = GodTools::Meta.all_languages.detect { |l| l.code == 'en' }
      assert language.packages.size > 1
      language.packages_by_status('live').each do |package|
        assert_equal 'live', package.status
      end
      assert_empty language.packages_by_status('bogus')
    end

  end
end
