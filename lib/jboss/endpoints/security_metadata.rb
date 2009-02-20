
import org.jboss.ruby.enterprise.endpoints.metadata.SecurityMetaData
import org.jboss.ruby.enterprise.endpoints.metadata.InboundSecurityMetaData
import org.jboss.ruby.enterprise.endpoints.metadata.OutboundSecurityMetaData


#lass << MyJavaClass; alias :oldnew :new; def new(..., &b); obj = oldnew; obj.block = b; end; e

class SecurityMetaData

  class << self
    alias :java_new :new

    def new(&block)
      puts "SMD: new #{block}"
      object = java_new
      puts "object is #{object}"
      object.configure( &block ) if block
      object
    end
  end

  def configure(&block)
    puts "SMD: configure #{block}"
    instance_eval &block if block 
  end

  def inbound(&block)
     puts "SMD: inbound #{block}"
    inbound = InboundSecurityMetaData.new(&block)
    setInboundSecurityMetaData( inbound )
  end

  def outbound(&block)
     puts "SMD: outbound #{block}"
    outbound = InboundSecurityMetaData.new(&block)
    setOutboundSecurityMetaData( outbound )
  end

end

class InboundSecurityMetaData

  class << self
    alias :java_new :new

    def new(&block)
      puts "ISMD: new #{block}"
      object = java_new
      puts "object is #{object}"
      object.configure( &block ) if block
      object
    end
  end

  def configure(&block)
    puts "ISMD: configure #{block}"
    instance_eval &block if block
  end

  def verify_timestamp
    puts "ISMD: verify_timestamp"
    self.setVerifyTimestamp( true )
  end

  def verify_signature
    puts "ISMD: verify_signature"
    puts "self.class = #{self.class}"
    puts "self.java_class = #{self.java_class}"
    self.setVerifySignature( true )
  end

end

class OutboundSecurityMetaData

  def initialize(&block)
    super()
    instance_eval &block if block
  end

end

