PKG_VERSION='1.0.0'
PKG_FILES= [
    'init.rb',
  ] + Dir[ 'lib/**/*.rb' ] + Dir[ '*.gemspec' ]

Gem::Specification.new do |s|
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
