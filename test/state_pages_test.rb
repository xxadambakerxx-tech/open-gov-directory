require 'yaml'

root = File.expand_path('..', __dir__)
require_relative '../_plugins/county_pages'

states_data = YAML.safe_load(File.read(File.join(root, '_data', 'states.yml')), permitted_classes: [Date], aliases: true)
site = Struct.new(:source, :data, :pages).new(root, { 'states' => states_data }, [])

Jekyll::StatePagesGenerator.new.generate(site)

state_pages = site.pages.select { |page| page.is_a?(Jekyll::StatePage) }
expected = states_data['states'].length
abort("Expected #{expected} generated state pages, got #{state_pages.length}") unless state_pages.length == expected

puts "Generated #{state_pages.length} state pages from configuration."
