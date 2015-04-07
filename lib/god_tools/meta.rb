module GodTools
  class Meta < ApiOperation

    def self.all
      Hashie::Mash.new get '/meta'
    end

  end
end
