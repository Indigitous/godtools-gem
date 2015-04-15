module GodTools
  class Meta

    def self.all_languages
      meta = Hashie::Mash.new GodTools.get '/meta'
      meta.languages.collect { |language_meta| Language.new(language_meta) }
    end

    class Language < Hashie::Trash
      property 'code'
      property 'name'
      property 'packages'

      def packages_by_status(status)
        packages.select { |p| p.status == status }
      end
    end

  end
end
