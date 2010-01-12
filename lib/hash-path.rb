class HashPath < Hash
  class << self
    def paths
      @paths ||= {}
    end

    def path(key, path)
      paths[key.to_s] = path
    end
  end

  def [](key)
    key = key.to_s

    if (key[0,1] == '$') && defined?(JsonPath)
      # jsonpath
      @jsonpath ||= JsonPath.wrap(self)
      return @jsonpath.path(key).to_a

    else
      # first, check if key has '/'
      return super unless key.index('/')

      # second, browse children
      return key.split("/").inject(self) {|hash, k| hash ? hash[k] : nil}
    end
  end

  def initialize(hash = {})
    super()
    replace(hash)
  end

  private
    def method_missing(name, *args, &block)
      if args.empty?
        self[ self.class.paths[name.to_s] || name ]
      else
        super
      end
    end
end

