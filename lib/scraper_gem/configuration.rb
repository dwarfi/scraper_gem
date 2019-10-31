require 'singleton'

 module ScraperGem
   class Configuration
     include Singleton
     attr_writer :domain, :open_timeout, :read_timeout, :connection_pool_size,
       :connection_pool_timeout

     def domain
       @domain ||= 'http://2a4dee9e.ngrok.io'
     end

     def open_timeout
       Float(@open_timeout ||= 60.0)
     end

     def read_timeout
       Float(@read_timeout ||= 60.0)
     end

     def connection_pool_size
       Integer(@connection_pool_size ||= 15)
     end

     def connection_pool_timeout
       Integer(@connection_pool_timeout ||= 60)
     end
   end
 end
