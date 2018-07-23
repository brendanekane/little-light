
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "little_light/version"

Gem::Specification.new do |spec|
  spec.name          = "little_light"
  spec.version       = LittleLight::VERSION
  spec.authors       = ["Brendan"]
  spec.email         = ["brendanekane@gmail.com"]

  spec.summary       = "Ruby wrapper for Destiny 2 API"
  spec.homepage      = "https://github.com/brendanekane/little_light"
  spec.license       = "MIT"



  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
