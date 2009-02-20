
puts "loading BaseEndpoint"

require 'jboss/endpoints/security_metadata'


require 'ostruct'

module JBoss
module Endpoints

class BaseEndpoint

  attr_reader :request
  attr_reader :operation
  attr_reader :principal

  def self.target_namespace(ns=nil)
    ( @target_namspace = ns ) if ( ns != nil )
    @target_namspace ||= nil
  end

  def self.port_name(pn=nil)
    ( @port_name = pn ) if ( pn != nil )
    @port_name ||= nil
  end

  def self.security(&block) 
    raise "Can only define security once per endpoint" if ( ( ! block.nil? ) && ( ! @security.nil? ) )
    unless block.nil?
      @security = SecurityMetaData.new( &block )
    end
    puts "returning security of #{@security}"
    @security
  end

  def dispatch(principal, operation, request, response_creator=nil )
    @principal = principal
    @request   = request
    @operation = operation
    @response_creator = response_creator
    method_name = operation.underscore.to_sym
    puts "method [#{method_name}]"
    send( operation.to_s.underscore.to_sym )
  end

  def create_response
    if ( @response_creator ) 
      return eval @response_creator
    end
    nil
  end

end

end # Endpoints
end # JBoss
