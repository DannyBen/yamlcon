YAML Config
==================================================

A utility for loading YAML files as first class configuration objects.

Install
--------------------------------------------------

Add to your gemfile

```ruby
gem 'yaml_conf'
```

Usage
--------------------------------------------------

```ruby
config = YAML.load_config 'path/to/config.yml'
puts config.any_option.or_nested
```



