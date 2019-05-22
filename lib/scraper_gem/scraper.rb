module ScraperGem
  class Scraper
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
      @response ||= API::Request.new(params).parsed_response
    end
  end
end
