require 'bundler/gem_tasks'

task default: [:ci]

desc "Run all tests"
task :ci do
  sh "rm -rf caboose-test"

  result = sh "rails new caboose-test -m caboose.rb && cd caboose-test && rake --trace"

  sh "rm -rf caboose-test"

  result
end

