require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = Dir.glob('spec/**/*_spec.rb')
  t.rspec_opts = '--format documentation'
end

task :default => :spec

desc 'Rubocop'
task :rubocop do
  sh 'rubocop'
end

desc 'Runs all build tasks'
task :build do
  Rake::Task['rubocop'].invoke
  Rake::Task['spec'].invoke
end
