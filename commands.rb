def help
  "Available commands: _'help'_, _'delays'_, _'elevator'_, _'depart south'_, _'depart north'_"
end

def get_delays
  response = HTTParty.get('http://api.bart.gov/api/bsa.aspx?cmd=bsa&key=MW9S-E7SL-26DU-VV8V&json=y')
  response.parsed_response['root']['bsa'].first['description']['#cdata-section']
end

def get_elevator_closures
  response = HTTParty.get('http://api.bart.gov/api/bsa.aspx?cmd=elev&key=MW9S-E7SL-26DU-VV8V&json=y')
  response.parsed_response['root']['bsa'].first['description']['#cdata-section']
end

def get_departures(_option)
  response = HTTParty.get("http://api.bart.gov/api/etd.aspx?cmd=etd&orig=CIVC&key=MW9S-E7SL-26DU-VV8V&dir=#{_option}&json=y")
  parsed = response.parsed_response['root']['station'].first['etd'].first

  car_length = parsed['estimate'].first['length']
  destination = parsed['destination']
  first_estimate = parsed['estimate'].first['minutes']
  second_estimate = parsed['estimate'][1]['minutes']

  "#{car_length} car #{destination} train departs in #{first_estimate} minutes. (Next in #{second_estimate} minutes.)"
end