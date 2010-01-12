begin
  require "jsonpath"
rescue
  $stderr.puts "'jsonpath' gem is not found. Please install it first!\ngem install jsonpath"
  raise
end
