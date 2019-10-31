 module ScraperGem
   module API
     class Request
       ApiError = Class.new(StandardError)

       attr_reader :params
       private :params

       def initialize(params={})
         @params = params
       end

       def parsed_response
         if response.success?
           response.body
         else
           raise ApiError,
             "Got response of #{response.status}, for request #{path}, with body #{params}."
         end
       end

       private

       def connection
         connection ||= Connections.instance.connection
       end

       def response
         @response ||= connection.get(path, params)
       end

       def domain
         config.domain
       end

       def config
         Configuration.instance
       end

       def path
         '/predict_prices'
       end
     end
   end
 end
