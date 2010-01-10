
class HashPath < Hash
  def self.paths
    @paths ||= {}
  end

  def self.path(key, path)
    paths[key.to_s] = path
  end

  def [](key)
    key = key.to_s

    # first, check exact value
    return super if has_key?(key)

    # second, browse children
    return key.split("/").inject(self) {|hash, key| hash[key]}
  rescue Exception => e
    return rescue_hierarchical_access(key, e)
  end

  def initialize(hash = {})
    super()
    replace(hash)
  end

  private
    def rescue_hierarchical_access(key, e)
      return nil
    end

    def method_missing(name, *args, &block)
      if args.empty?
        self[ self.class.paths[name.to_s] || name ]
      else
        super
      end
    end
end

