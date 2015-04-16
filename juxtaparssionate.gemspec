Gem::Specification.new do |s|
  s.name        = 'juxtaparssionate'
  s.version     = '0.0.0'
  s.date        = '2015-0413'
  s.summary     = 'A tool for parsing and comparing job postings'
  s.description = 'juxtaparssionate parses and compares job postings from various popular job boards. By comparing word frequency, sentence length, and parts-of-speech counts, juxtaparssionate produces metrics loosely determining the quality and uniqueness of a job posting'
  s.authors     = 'Thomas Osborn'
  s.email       = 'trosborn@gmail.com'
  s.files       = Dir['lib/*'] + Dir['test/**/*'] + 'README.md'
  s.homepage    = 'http://www.github.com/trosborn/passion-parse'
  s.license     = 'MIT'

  s.add_runtime_dependency 'treat'
  s.add_runtime_dependency 'rwordnet'
  s.add_runtime_dependency 'nokogiri'
  s.add_runtime_dependency 'mechanize'
  s.add_runtime_dependency 'sanitize'
end
