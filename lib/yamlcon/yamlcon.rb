require 'yaml'
require 'ostruct'

module YAMLCon
  def self.load_config(file)
    hash = YAML.load_file file
    hash_to_struct hash
  end

  def self.save_config(file, data)
    File.open file, 'w' do |f| 
      f.write struct_to_yaml data
    end
  end

  def self.hash_to_struct(hash)
    return hash unless hash.is_a? Hash
    dotted = OpenStruct.new hash

    hash.each do |key, value| 
      if value.is_a? Hash
        dotted[key] = hash_to_struct(value) 
      elsif value.is_a? Array
        dotted[key] = value.collect {|item| hash_to_struct item }
      end
    end

    dotted
  end

  def self.struct_to_hash(dot_notation)
    hash = {}
    dot_notation.each_pair do |k, v| 
      hash[k.to_s] = v.is_a?(OpenStruct) ? struct_to_hash(v) : v
    end
    hash
  end

  def self.struct_to_yaml(dot_notation)
    struct_to_hash(dot_notation).to_yaml
  end
end
