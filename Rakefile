require 'rake/testtask'
require 'rubygems/package_task'

test_files = Dir.glob('test/**/*_test.rb')

desc "Default Task"
task :default => :test

# Run the unit tests
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = test_files

  t.warning = true
  t.verbose = true
end

task :active_model_tests do
  ruby "lib/attribute_methods.rb"
  ruby "lib/callbacks.rb"
  ruby "lib/conversion.rb"
  ruby "lib/dirty.rb"
  ruby "lib/validations.rb"
  ruby "lib/naming.rb"
  ruby "lib/serialization.rb"
  ruby "lib/serializers_json.rb"
  ruby "lib/serializers_xml.rb"
end