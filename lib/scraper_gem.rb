require "scraper_gem/version"
require "scraper_gem/scraper"
require "scraper_gem/api"
require "scraper_gem/configuration"

module ScraperGem
  def self.configure
    yield(Configuration.instance)
  end
end
