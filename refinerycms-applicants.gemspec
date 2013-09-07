# Encoding: UTF-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'version'

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-applicants'
  s.version           = Refinery::Applicants::VERSION
  s.description       = 'Ruby on Rails Applicants engine for Refinery CMS'
  s.authors           = ['Nick Plante']
  s.email             = ['nap@zerosum.org']
  s.summary           = 'Applicants engine for Refinery CMS'
  s.require_paths     = %w(lib)

  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*', 'README.md', 'LICENSE']
  s.extra_rdoc_files  = %w(README.md LICENSE)

  s.add_dependency 'refinerycms', '~> 1.0'
end
