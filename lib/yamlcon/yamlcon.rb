require 'yaml'
require 'ostruct'

module YAMLCon
  def self.load_config(file)
    hash = YAML.load_file file
    dot_notation_from hash
  end

  def self.dot_notation_from(hash)
    dotted = OpenStruct.new hash
    hash.each do |k, v| 
      dotted[k] = dot_notation_from(v) if v.is_a? Hash
    end
    dotted
  end
end
