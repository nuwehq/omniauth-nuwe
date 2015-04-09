# coding: utf-8
require File.expand_path('../lib/omniauth-nuwe/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "omniauth-nuwe"
  spec.version       = Omniauth::Nuwe::VERSION
  spec.authors       = ["Stephanie Nemeth"]
  spec.email         = ["stephanie@spacebabies.nl"]
  spec.summary       = %q{OmniAuth strategy for Nuwe.}
  spec.description   = %q{OmniAuth strategy for Nuwe.}
  spec.homepage      = "https://github.com/nuwehq/omniauth-nuwe/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.require_paths = ["lib"]


  spec.add_dependency 'omniauth', '~> 1.0'
    # Nothing lower than omniauth-oauth2 1.1.1
    # http://www.rubysec.com/advisories/CVE-2012-6134/
  spec.add_dependency 'omniauth-oauth2', '>= 1.1.1', '< 2.0'
  spec.add_development_dependency 'rspec', '3.2.0'
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
