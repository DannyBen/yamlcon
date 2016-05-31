require 'yaml'
require 'ostruct'

module YAMLCon
  def self.load_config(path)
    if path.include? "*"
      result = OpenStruct.new
      Dir[path].each do |file|
        basename = File.basename(file).sub(/\..*/, '')
        result[basename] = hash_to_struct YAML.load_file(file)
      end
      result
    else
      hash_to_struct YAML.load_file(path)
    end
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
    return dot_notation unless dot_notation.is_a? OpenStruct

    hash = {}
    dot_notation.each_pair do |k, v| 
      if v.is_a? OpenStruct
        value = struct_to_hash(v) 
      elsif v.is_a? Array
        value = v.map { |val| struct_to_hash val }
      else
        value = v
      end

      hash[k.to_s] = value
    end
    hash
  end

  def self.struct_to_yaml(dot_notation)
    struct_to_hash(dot_notation).to_yaml
  end
end
