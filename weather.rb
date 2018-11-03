
require 'net/http'
require 'uri'
require 'rexml/document'

CLOUDINESS = { 0 => 'Clear', 1 => 'Partly cloudy', 2 => 'Cloudy', 3 => 'Overcast'}
uri = URI.parse('https://xml.meteoservice.ru/export/gismeteo/point/25.xml')

response = Net::HTTP.get_response(uri)

doc = REXML::Document.new(response.body)

city_name = URI.unescape(doc.root.elements['REPORT/TOWN'].attributes['sname'])

current_forcast = doc.root.elements['REPORT/TOWN'].elements.to_a[0]

# temperature
min_temp = current_forcast.elements['TEMPERATURE'].attributes['min']
max_temp = current_forcast.elements['TEMPERATURE'].attributes['max']

max_wind = current_forcast.elements['WIND'].attributes['max']

cloud_index = current_forcast.elements['PHENOMENA'].attributes['cloudiness'].to_i

clouds = CLOUDINESS[cloud_index]

puts '|-----------------------------|'
puts '|            ' + city_name + '             |'
puts '|-----------------------------|'
puts '|'+ "The temperature: from #{min_temp} to #{max_temp}" + '|'
puts '|-----------------------------|'
puts '|'+ "Wind speed till #{max_wind} m/s" + '        |'
puts '|-----------------------------|'
puts '|'+ clouds + '                     |'
puts '|-----------------------------|'



