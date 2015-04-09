module GodTools
  class Meta

    def self.all
      Hashie::Mash.new GodTools.get '/meta'
    end

  end
end
