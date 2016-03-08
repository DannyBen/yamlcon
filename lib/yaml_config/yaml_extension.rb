require 'yaml'

module YAML
  def self.load_config(file)
    YAMLConfig.load_config file
  end
end
