task default: [:ci]

task :ci do
  sh "rm -rf caboose-test"

  result = sh "rails new caboose-test -m caboose.rb && cd caboose-test && rake --trace"

  sh "rm -rf caboose-test"

  result
end

