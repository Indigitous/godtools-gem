Gem::Specification.new do |s|
  s.name        = 'god_tools'
  s.version     = '0.0.0'
  s.date        = '2015-04-01'
  s.summary     = 'Ruby bindings for the Cru GodTools API'
  s.description = 'For more about the API see https://github.com/CruGlobal/godtools-api'
  s.authors     = ['Sheldon Dueck']
  s.email       = 'sheldon@ballistiq.com'
  s.homepage    = 'https://github.com/Indigitous/godtools-gem'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ['lib']

  s.add_dependency 'httparty', '~> 0.13.3'
  s.add_dependency 'hashie', '~> 3.4.1'

  s.add_development_dependency 'minitest', '~> 5.5.1'
  s.add_development_dependency 'webmock', '~> 1.21.0'
  s.add_development_dependency 'irbtools', '~> 2.0.0'
  s.add_development_dependency 'irbtools-more', '~> 2.0.0'
  s.add_development_dependency 'terminal-notifier', '~> 1.6.3'
end
