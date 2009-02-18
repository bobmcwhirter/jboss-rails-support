require 'rubygems'
require 'rake/gempackagetask'

PKG_VERSION='1.0.0'
PKG_FILES=FileList['**/*.rb', '*.gemspec' ]

spec = Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.summary = "JBoss-Rails Support gem"
  s.name = 'jboss-rails-support'
  s.version = PKG_VERSION
  s.requirements << 'none'
  s.require_path = 'lib'
  s.autorequire = ''
  s.files = PKG_FILES
  s.description = "JBoss-Rails Support gem"
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
end

