YAMLCon - YAML Config Loader
==================================================

[![Gem Version](https://badge.fury.io/rb/yamlcon.svg)](https://badge.fury.io/rb/yamlcon)
[![Build Status](https://travis-ci.com/DannyBen/yamlcon.svg?branch=master)](https://travis-ci.com/DannyBen/yamlcon)
[![Maintainability](https://api.codeclimate.com/v1/badges/532084393e9f979d4381/maintainability)](https://codeclimate.com/github/DannyBen/yamlcon/maintainability)

---

A utility for loading and saving YAML files with dot.notation.

Install
--------------------------------------------------

Add to your gemfile

```ruby
gem 'yamlcon'
```

Usage
--------------------------------------------------

Load a single file

```ruby
config = YAML.load_config 'path/to/config.yml'
puts config.any_option.or_nested
```

You can then modify and save the file

```ruby
config.some_setting = 'value'
YAML.save_config 'filename.yml', config
```

Load multiple files by providing a glob pattern. In this case, each loaded
file will get its own prefix, using the basename of the file.

For example, given two files `config/one.yml` and `config/two.yml`, you can
do this:

```ruby
config = YAML.load_config 'config/*.yml'
puts config.one.option
puts config.two.option
```
