require 'influxer/version'

# Rails client for InfluxDB
module Influxer
  require 'influxer/config'
  require 'influxer/client'
  require 'influxer/metrics/metrics'

  module Model # :nodoc:
    require 'influxer/model'
  end

  require 'influxer/rails/client' if defined?(Rails)
  require 'influxer/engine' if defined?(Rails)

  def self.config
    @config ||= Config.new
  end

  def self.configure
    yield(config) if block_given?
  end

  def self.client
    @client ||= Client.new
  end

  def self.reset!
    @client.stop! unless @client.nil?
    @config = nil
    @client = nil
  end
end
