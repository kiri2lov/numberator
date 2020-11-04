lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/numberator/version'

Gem::Specification.new do |spec|
  spec.name          = "numberator"
  spec.version       = Numberator::VERSION
  spec.authors       = ["kiri2lov"]
  spec.email         = ["kiri2lov@gmail.com"]
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.3")
  spec.summary       = ""
  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.executables   = ["numberator"]
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency "linked-list", "~> 0.0.15"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
