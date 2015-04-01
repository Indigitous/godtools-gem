Gem::Specification.new do |s|
  s.name        = 'god_tools'
  s.version     = '0.0.0'
  s.date        = '2015-04-01'
  s.summary     = 'Ruby bindings for the Cru GodTools API'
  s.description = 'For more about the API see https://github.com/CruGlobal/godtools-api'
  s.authors     = ['Sheldon Dueck']
  s.email       = 'sheldon@ballistiq.com'
  s.files       = ['lib/god_tools.rb']
  s.homepage    = 'https://github.com/Indigitous/godtools-gem'

  s.add_dependency('rest-client', '~> 1.8.0')
  s.add_dependency('json', '~> 1.8.2')
end

