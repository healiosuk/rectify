require File.expand_path("lib/rectify/version", __dir__)

Gem::Specification.new do |spec|
  spec.name = "rectify"

  spec.authors = ["Andy Pike", "Jonic Linley"]
  spec.description = "Build Rails apps in a more maintainable way"
  spec.email = ["andy@andypike.com", "jonic.linley@healiospec.org.uk"]
  spec.homepage = "https://github.com/healiosuk/rectify"
  spec.summary = "Improvements for building Rails apps"
  spec.version = Rectify::VERSION

  spec.files = Dir["LICENSE.txt", "readme.md", "lib/**/*"]
  spec.license = "MIT"
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.7.8"

  spec.metadata["allowed_push_host"] = "https://rubygemspec.pkg.github.com/healiosuk"
  spec.metadata["github_repo"] = "ssh://github.com/healiosuk/rectify"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["rubygems_mfa_required"] = "true"
  spec.metadata["source_code_uri"] = spec.homepage

  spec.add_dependency "activemodel", "~> 7.0"
  spec.add_dependency "activerecord", "~> 7.0"
  spec.add_dependency "activesupport", "~> 7.0"
  spec.add_dependency "virtus", "~> 1.0"
  spec.add_dependency "wisper", "~> 1.6"
end
