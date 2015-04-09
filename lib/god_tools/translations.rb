module GodTools
  class Translations

    attr_accessor :language, :package

    def initialize(language:, package:)
      @language = language
      @package = package
    end

    def config
      Config.new GodTools.get "#{ base_path }/config"
    end

    def page(page_id)
      Page.new GodTools.get "#{ base_path }/pages/#{ page_id }"
    end

    private

      def base_path
        "/translations/#{ @language }/#{ @package }"
      end

      class Config < Hashie::Trash
        property 'about', transform_with: lambda { |v| Hashie::Mash.new(v) }
        property 'page_set', from: 'pageSet', with: lambda { |v| v.collect { |e| Hashie::Mash.new(e) } }
        property 'package_name', from: 'packageName', with: lambda { |v| Hashie::Mash.new(v) }
      end

      class Page < Hashie::Trash
        property 'translated_strings', from: 'translatedStrings'
      end

  end
end
