require 'yaml'
require 'ostruct'

module YAMLCon
  class << self
    def load_config(path)
      if path.include? '*'
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

    def save_config(file, data)
      File.write file, struct_to_yaml(data)
    end

    def hash_to_struct(hash)
      return hash unless hash.is_a? Hash

      dotted = OpenStruct.new hash

      hash.each do |key, value|
        case value
        when Hash
          dotted[key] = hash_to_struct(value)
        when Array
          dotted[key] = value.collect { |item| hash_to_struct item }
        end
      end

      dotted
    end

    def struct_to_hash(dot_notation)
      return dot_notation unless dot_notation.is_a? OpenStruct

      hash = {}
      dot_notation.each_pair do |k, v|
        value = case v
        when OpenStruct
          struct_to_hash(v)
        when Array
          v.map { |val| struct_to_hash val }
        else
          v
        end

        hash[k.to_s] = value
      end

      hash
    end

    def struct_to_yaml(dot_notation)
      struct_to_hash(dot_notation).to_yaml
    end
  end
end
