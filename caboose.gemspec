Gem::Specification.new do |s|
  s.name     = "caboose"
  s.version  = '1.0.0.pre'
  s.homepage = "http://justincampbell.github.com/caboose"
  s.summary  = "Template for Rails"

  s.author = "Justin Campbell"
  s.email  = "jcampbell@justincampbell.me"

  s.executables   = 'caboose'
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['templates']

  s.add_dependency 'rails'

  s.add_development_dependency 'rake'
end
