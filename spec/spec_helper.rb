
require 'spec'
require 'pathname'

require File.join(File.dirname(__FILE__), '/../lib/hash-path')
require File.join(File.dirname(__FILE__), '/its_helper')

def data(key)
  path   = Pathname(__FILE__).parent + "fixtures/#{key}"
  buffer = File.read(path){}

  case path.extname
  when ".json"
    require 'json'
    buffer = JSON.parse(buffer)
  end

  return buffer
end
