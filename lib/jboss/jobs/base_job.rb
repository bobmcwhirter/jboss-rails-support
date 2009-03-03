
import org.jboss.ruby.enterprise.jobs.BaseJobRb

module JBoss
module Jobs

class BaseJob < BaseJobRb

  def log
    self.getLogger()
  end

end

end # Jobs
end # JBoss


puts "created JBoss::Jobs::BaseJob"
