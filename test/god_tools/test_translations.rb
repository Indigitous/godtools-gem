require 'test_helper'

module GodTools
  class TestTranslations < Minitest::Test

    def test_initialize
      translation = GodTools::Translations.new language: 'en', package: 'kgp'
      assert_equal 'en', translation.language
      assert_equal 'kgp', translation.package
    end

    def test_config
      config = GodTools::Translations.new(language: 'en', package: 'kgp').config
      assert_kind_of GodTools::Translations::Config, config
      assert_equal 'Knowing God Personally', config.package_name.title
      assert_kind_of Array, config.page_set
      assert_equal 13, config.page_set.size
      assert_equal 'Home', config.page_set.first.title
      assert_equal 'About', config.about.title
    end

    def test_page
      page = GodTools::Translations.new(language: 'en', package: 'kgp').page('a348a98b-77b1-4542-931c-c1af41bd206e')
      assert_kind_of GodTools::Translations::Page, page
      assert_kind_of Hash, page.translated_strings
      assert_equal 'KNOWING GOD', page.translated_strings['02cf6004-a0f9-4828-be26-09253d4490b6']
    end

  end
end

