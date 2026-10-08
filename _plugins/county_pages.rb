require 'jekyll'

module Jekyll
  class StatePage < PageWithoutAFile
    def initialize(site, state)
      @site = site
      @base = site.source
      @dir = File.join("states", state.fetch("slug"))
      @name = "index.html"
      process(@name)
      self.data = {
        "layout" => "state",
        "title" => state.fetch("name"),
        "state_slug" => state.fetch("slug"),
        "state_code" => state.fetch("code"),
        "permalink" => "/states/#{state.fetch('slug')}/"
      }
    end
  end

  class CountyPage < PageWithoutAFile
    def initialize(site, state, county)
      @site = site
      @base = site.source
      @dir = File.join("states", state.fetch("slug"), county.fetch("slug"))
      @name = "index.html"
      process(@name)
      self.data = {
        "layout" => "county",
        "title" => county.fetch("name"),
        "county_id" => county.fetch("id"),
        "permalink" => "/states/#{state.fetch('slug')}/#{county.fetch('slug')}/"
      }
    end
  end

  class StatePagesGenerator < Generator
    safe true

    def generate(site)
      states = site.data.dig("states", "states") || []

      states.each do |state|
        site.pages << StatePage.new(site, state)
      end
    end
  end

  class CountyPagesGenerator < Generator
    safe true

    def generate(site)
      states = site.data.dig("states", "states") || []
      counties = site.data.dig("counties", "counties") || []

      counties.each do |county|
        state = states.find { |entry| entry["code"] == county["state_code"] }
        next unless state

        site.pages << CountyPage.new(site, state, county)
      end
    end
  end
end