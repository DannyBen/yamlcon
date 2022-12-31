lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yamlcon/version'

Gem::Specification.new do |s|
  s.name        = 'yamlcon'
  s.version     = YAMLCon::VERSION
  s.summary     = 'YAML Config Loader'
  s.description = 'Utility for easily loading YAML files as configuration objects'
  s.authors     = ['Danny Ben Shitrit']
  s.email       = 'db@dannyben.com'
  s.files       = Dir['README.md', 'lib/**/*.rb']
  s.homepage    = 'https://github.com/DannyBen/yamlcon'
  s.license     = 'MIT'

  s.required_ruby_version = '>= 2.7.0'
  s.metadata['rubygems_mfa_required'] = 'true'
end
