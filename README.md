YAMLCon - YAML Config Loader
==================================================

[![Gem Version](https://badge.fury.io/rb/yamlcon.svg)](http://badge.fury.io/rb/yamlcon)
[![Build Status](https://travis-ci.org/DannyBen/yamlcon.svg?branch=master)](https://travis-ci.org/DannyBen/yamlcon)
[![Code Climate](https://codeclimate.com/github/DannyBen/yamlcon/badges/gpa.svg)](https://codeclimate.com/github/DannyBen/yamlcon)
[![Dependency Status](https://gemnasium.com/DannyBen/yamlcon.svg)](https://gemnasium.com/DannyBen/yamlcon)

--------------------------------------------------

A utility for loading and saving YAML files with dot.notation.

Install
--------------------------------------------------

Add to your gemfile

```ruby
gem 'yamlcon'
```

Usage
--------------------------------------------------

```ruby
# Load
config = YAML.load_config 'path/to/config.yml'
puts config.any_option.or_nested

# Modify and save
config.some_setting = 'value'
YAML.save_config 'filename.yml', config
```
