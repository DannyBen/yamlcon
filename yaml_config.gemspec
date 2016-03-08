lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yaml_config/version'

Gem::Specification.new do |s|
  s.name        = 'yaml_config'
  s.version     = YAMLConfig::VERSION
  s.date        = Date.today.to_s
  s.summary     = "Load YAML as configuration file"
  s.description = "Utility for easily loading YAML files as configuration objects"
  s.authors     = ["Danny Ben Shitrit"]
  s.email       = 'db@dannyben.com'
  s.files       = Dir['README.md', 'lib/**/*.rb']
  s.homepage    = 'https://github.com/DannyBen/yaml_config'
  s.license     = 'MIT'
  s.required_ruby_version = ">= 2.0.0"

  s.add_development_dependency "runfile", "~> 0.6"
  s.add_development_dependency "run-gem-dev", "~> 0.3"
end
