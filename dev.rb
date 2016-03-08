
require 'yaml_config'

include YAMLConfig

conf = YAML.load_config ".travis.yml"
p conf.notifications.email