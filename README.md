YAML Config
==================================================

A utility for loading YAML files as first class configuration objects.

Install
--------------------------------------------------

```shell
$ gem install yaml_config
```

or add to your gemfile

```ruby
gem 'yaml_config'
```

Usage
--------------------------------------------------

```ruby
config = YAML.load_config 'path/to/config.yml'
puts config.any_option.or_nested
```



