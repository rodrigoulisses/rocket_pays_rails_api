# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rocket_pays_rails_api/version'

Gem::Specification.new do |spec|
  spec.name          = "rocket_pays_rails_api"
  spec.version       = RocketPaysRailsApi::VERSION
  spec.authors       = ["Rodrigo Ulisses e Silva"]
  spec.email         = ["rodrigo.ulisses7@gmail.com"]

  spec.description   = %q{Gem used to integration with RokcetPays}
  spec.summary       = spec.description
  spec.homepage      = "http://www.devworks.net.br"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activemodel', '~> 4.1'
  spec.add_dependency 'enumerize'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
