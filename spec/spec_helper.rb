
require 'spec'

require File.join(File.dirname(__FILE__), '/../lib/hash-path')
require File.join(File.dirname(__FILE__), '/its_helper')

def data(key)
  path = File.join(File.dirname(__FILE__) + "/fixtures/#{key}")
  File.read(path){}
end
