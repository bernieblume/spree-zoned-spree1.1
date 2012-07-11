# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_zoned'
  s.version     = '0.5.23'
  s.summary     = 'A Spree extension to make your store zoned'
  s.description = "Everything you need for a zoned Spree store: zoned pricing, zoned products, zoned product ordering, zoned locales, ...\nProbalbly essential to you if you operate outside of the US."
  s.required_ruby_version = '>= 1.9.2'

  s.author      = 'Bernd Blume'
  s.email       = 'bernd.blume@railando.com'
  s.homepage    = 'http://www.berndblume.com'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.files        = `git ls-files`.split($\)
  s.executables  = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files   = s.files.grep(%r{^(test|spec|features)/})
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.1.1'

  s.add_development_dependency 'capybara', '1.0.1'
  s.add_development_dependency 'factory_girl', '~> 2.6.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.9'
  s.add_development_dependency 'sqlite3'
end
