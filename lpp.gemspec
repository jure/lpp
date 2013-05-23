# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lpp/version'

Gem::Specification.new do |spec|
  spec.name          = "lpp"
  spec.version       = Lpp::VERSION
  spec.authors       = ["Jure Triglav"]
  spec.email         = ["juretriglav@gmail.com"]
  spec.description   = %q{LPP is a simple gem for getting bus arrivals in Ljubljana. It uses the wbus.talktrack.com website.}
  spec.summary       = %q{Ljubljana bus arrivals gem}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry"
  # Tests
  spec.add_development_dependency "rake"
  spec.add_development_dependency "webmock"

  spec.add_dependency "nokogiri", "~> 1.5"
end
