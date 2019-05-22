require 'connection_pool'
require 'faraday'
require 'faraday_middleware'
require 'singleton'
require 'typhoeus'
require 'typhoeus/adapters/faraday'

 module ScraperGem
   module API
     class Connections
       include Singleton

       def connection
         @connection ||= Wrapper.new(pool)
       end

       private

       def pool
         @pool ||= ConnectionPool.new(size: pool_size, timeout: pool_timeout) do
           new_connection
         end
       end

       def pool_size
         configuration.connection_pool_size
       end

       def pool_timeout
         configuration.connection_pool_timeout
       end

       def new_connection
         Faraday.new(url: configuration.domain) do |builder|
           builder.options[:open_timeout] = configuration.open_timeout
           builder.options[:timeout] = configuration.read_timeout

           builder.use FaradayMiddleware::EncodeJson
           builder.use FaradayMiddleware::ParseJson, content_type: 'application/json'

           builder.adapter :typhoeus
         end
       end

       def configuration
         Configuration.instance
       end

       class Wrapper
         attr_reader :pool
         private :pool

         def initialize(pool)
           @pool = pool
         end

         def get(*args)
           pool.with { |connection| connection.get(*args) }
         end
       end
     end
   end
 end

