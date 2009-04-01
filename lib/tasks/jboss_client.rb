
#client_dir = File.expand_path( File.dirname( __FILE__ ) + '/../../client/' )
client_dir = RAILS_ROOT + "/client"
client_lib_dir = client_dir + "/lib"

namespace :jboss do
  namespace :client do

    CORE_CLIENT_JARS = [
      "jboss-rails.jar"
    ]

    DEPENDENCY_CLIENT_JARS = [
      "jboss-messaging-client.jar",
      "jboss-javaee.jar",
      "jboss-logging-spi.jar",
    ]

    directory client_lib_dir
    directory client_lib_dir + '/core'
    directory client_lib_dir + '/dependencies'

    desc "Set up support for client applications"
    task :setup=>[ :client_jars, :boot_script ] 

    task :client_jars=>[ :core_client_jars, :dependency_client_jars ]

    task :core_client_jars=>[ client_lib_dir + '/core' ] 

    task :dependency_client_jars=>[ client_lib_dir + '/dependencies' ]

    CORE_CLIENT_JARS.each do |jar|
      jar_path = "#{client_lib_dir}/core/#{jar}"
      file jar_path do
        Dir.chdir client_dir do
          `jar xvf #{JBoss::RakeUtils.deployer} lib/core/#{jar}`
        end
        puts "Installed #{jar}"
      end
      task :core_client_jars=>[ jar_path ]
    end

    DEPENDENCY_CLIENT_JARS.each do |jar|
      jar_path = "#{client_lib_dir}/dependencies/#{jar}"
      task jar_path do 
        FileUtils.cp( "#{JBoss::RakeUtils.jboss_home}/client/#{jar}", client_lib_dir + "/dependencies" )
        puts "Installed #{jar}"
      end
      task :dependency_client_jars=>[ jar_path ]
    end

    boot_script_file = client_dir + "/boot.rb"

    task :boot_script do 
      puts "creating boot script"
      File.open( boot_script_file, 'w' ) do |f|
        f.write( File.read( File.dirname(__FILE__) + '/boot.rb.in' ) )
      end
    end


  end
end
