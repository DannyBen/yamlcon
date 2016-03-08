require 'yaml'

module YAML
  def self.load_config(file)
    YAMLConf.load_config file
  end
end
