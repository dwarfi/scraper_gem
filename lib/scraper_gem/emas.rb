module ScraperGem
  class Emas
    attr_reader :params
    private :params

    def initialize(params)
      @params = params
    end

    def get
      response
    end

    private

    def response
      @response ||= API::Request.new(path, params).parsed_response
    end

    def path
      '/emas'
    end
  end
end
