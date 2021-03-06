# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/numberator/version'

Gem::Specification.new do |spec|
  spec.name          = 'numberator'
  spec.version       = Numberator::VERSION
  spec.authors       = ['kiri2lov']
  spec.email         = ['kiri2lov@gmail.com']
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.5')
  spec.summary       = ''
  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.executables   = ['numberator']
  spec.require_paths = ['lib']
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rubocop', '~> 1.2'
end
