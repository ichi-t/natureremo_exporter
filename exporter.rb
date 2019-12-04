require 'sinatra'
require 'nature_remo'

get '/metrics' do
  <<-"EOS"
  #{temperture}<br>
  #{humidity}<br>
  #{illumination}
  EOS
end

def temperture
  "natureremo_temperture_celcius" + label + client.get_temp.to_s
end

def humidity
  "natureremo_humidity" + label + client.get_humi.to_s
end

def illumination
  "natureremo_illumination_lux" + label + client.get_illu.to_s
end

def label
  <<-"EOS"
  {appliance_name="#{JSON.parse(client.appliances.body)[0]["device"]["name"]}",
  appliance_id="#{JSON.parse(client.appliances.body)[0]["device"]["id"]}"}
  EOS
end

def client
  client ||= NatureRemo::Client.new(ENV['NATURE_TOKEN'])
end
