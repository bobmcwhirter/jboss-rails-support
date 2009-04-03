
import org.jboss.ruby.enterprise.queues.BaseQueueRb
import org.jboss.ruby.enterprise.queues.RubyTaskQueueClient

module JBoss
module Queues

class BaseQueue < BaseQueueRb

  def log
    self.getLogger()
  end

  def self.enqueue(task, payload=nil)
    puts( "enqueuing #{task} #{payload.inspect}" )
    destination_name = "#{JBoss::Client.current.application_name}.#{self.name}"
    puts "destination #{destination_name}"
    client = RubyTaskQueueClient.new
    begin
      client.set_destination_name( destination_name )
      client.enqueue( task.to_s, payload )
    ensure
      #client.close
    end
  end

end

end
end
