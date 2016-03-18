require 'yaml'

module YAML
  def self.load_config(file)
    YAMLCon.load_config file
  end

  def self.save_config(file, data)
    YAMLCon.save_config file, data
  end
end
