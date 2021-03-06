lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'date'
require 'yamlcon/version'

Gem::Specification.new do |s|
  s.name        = 'yamlcon'
  s.version     = YAMLCon::VERSION
  s.date        = Date.today.to_s
  s.summary     = "YAML Config Loader"
  s.description = "Utility for easily loading YAML files as configuration objects"
  s.authors     = ["Danny Ben Shitrit"]
  s.email       = 'db@dannyben.com'
  s.files       = Dir['README.md', 'lib/**/*.rb']
  s.homepage    = 'https://github.com/DannyBen/yamlcon'
  s.license     = 'MIT'
  s.required_ruby_version = ">= 2.3.0"
end
