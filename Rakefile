require 'rake/testtask'

desc "Default Task"
task :default => :test

# Run the unit tests
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = Dir.glob('test/**/*_test.rb')

  t.warning = true
  t.verbose = true
end