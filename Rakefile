require 'rubygems'
require 'rake/gempackagetask'

gemspec_text = File.read( File.dirname( __FILE__ ) + "/jboss-rails-support.gemspec" )
gemspec = eval( gemspec_text )

Rake::GemPackageTask.new(gemspec) do |pkg|
  pkg.need_zip = false
  pkg.need_tar = false
end

task :default=>[ :package ] do
end

task :clean=>[ :clobber_package ] do
end
