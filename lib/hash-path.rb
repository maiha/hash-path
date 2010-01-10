
class HashPath
  def self.paths
    @paths ||= {}
  end

  def self.path(key, path)
    paths[key.to_sym] = path
  end

  def initialize(hash)
    @hash   = hash
    @cached = {}
  end

  private
    def method_missing(name, *args, &block)
      name = name.to_sym
      return @cached[name] if @cached.has_key?(name)
      return super unless path = self.class.paths[name]
      return @cached[name] = path.split("/").inject(@hash) {|hash, key| hash[key]} rescue nil
    end
end

