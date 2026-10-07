require 'yaml'

root = File.expand_path('..', __dir__)
counties_path = File.join(root, '_data', 'counties.yml')
departments_path = File.join(root, '_data', 'department_types.yml')

abort("Missing _data/counties.yml") unless File.exist?(counties_path)
abort("Missing _data/department_types.yml") unless File.exist?(departments_path)

counties_data = YAML.safe_load(File.read(counties_path), permitted_classes: [Date], aliases: true)
departments_data = YAML.safe_load(File.read(departments_path), permitted_classes: [Date], aliases: true)

abort('Expected top-level "version" key in counties.yml') unless counties_data.is_a?(Hash) && counties_data['version']
abort('Expected top-level "counties" array in counties.yml') unless counties_data['counties'].is_a?(Array)
abort('Expected top-level "department_types" array in department_types.yml') unless departments_data.is_a?(Hash) && departments_data['department_types'].is_a?(Array)

allowed_types = departments_data['department_types'].map { |dept| dept['key'] }.compact
counties = counties_data['counties']
abort('Expected at least one county entry') if counties.empty?

counties.each do |county|
  abort("County entry missing name: #{county.inspect}") unless county['name']
  abort("County entry missing slug: #{county.inspect}") unless county['slug']
  abort("County entry missing state: #{county.inspect}") unless county['state']
  abort("County entry missing state_code: #{county.inspect}") unless county['state_code']
  departments = county['departments']
  abort("County entry missing departments: #{county.inspect}") unless departments.is_a?(Array)
  abort("County departments cannot be empty: #{county['name']}") if departments.empty?

  departments.each do |department|
    abort("Department missing type: #{department.inspect}") unless department['type']
    abort("Department type not recognized: #{department['type']}") unless allowed_types.include?(department['type'])
    abort("Department missing name: #{department.inspect}") unless department['name']
    abort("Department missing url: #{department.inspect}") unless department['url']
  end
end

puts "YAML schema validation passed for #{counties.length} counties and #{allowed_types.length} department types."
