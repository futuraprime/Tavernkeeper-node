# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# JavaScript/CoffeeScript watchers

guard 'mocha-node' do
  watch(%r{^spec/(.+)-spec\.(js\.coffee|js|coffee)})  { |m| "spec/#{m[1]}-spec.#{m[2]}" }
  watch(%r{^server/(.+)\.(js\.coffee|js|coffee)})        { |m| "spec/server/#{m[1]}-spec.#{m[2]}" }
  watch(%r{spec/spec_helper\.(js\.coffee|js|coffee)}) { "spec" }
end
