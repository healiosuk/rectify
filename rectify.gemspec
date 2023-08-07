require File.expand_path("../lib/rectify/version", __FILE__)

Gem::Specification.new do |s|
  s.name          = "rectify"
  s.version       = Rectify::VERSION
  s.summary       = "Improvements for building Rails apps"
  s.description   = "Build Rails apps in a more maintainable way"
  s.authors       = ["Andy Pike", "Jonic Linley"]
  s.email         = ["andy@andypike.com", "jonic.linley@healios.org.uk"]
  s.files         = Dir["LICENSE.txt", "readme.md", "lib/**/*"]
  s.homepage      = "https://github.com/healiosuk/rectify"
  s.license       = "MIT"
  s.require_paths = ["lib"]

  s.metadata['allowed_push_host'] = 'https://rubygems.pkg.github.com/healiosuk'
  s.metadata['homepage_uri'] = s.homepage
  s.metadata['source_code_uri'] = s.homepage
  s.metadata['github_repo'] = 'ssh://github.com/healiosuk/rectify'

  s.add_dependency "activemodel",   "~> 7.0"
  s.add_dependency "activerecord",  "~> 7.0"
  s.add_dependency "activesupport", "~> 7.0"
  s.add_dependency "virtus",        "~> 1.0"
  s.add_dependency "wisper",        "~> 1.6"

  s.add_development_dependency "actionpack"
  s.add_development_dependency "debug"
  s.add_development_dependency "fuubar"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-collection_matchers"
  s.add_development_dependency "rubocop"
  s.add_development_dependency "rubocop-gitlab-security"
  s.add_development_dependency "rubocop-performance"
  s.add_development_dependency "rubocop-rspec"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "syntax_suggest"
end
