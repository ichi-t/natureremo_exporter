require 'sinatra'
require 'nature_remo'

get '/metrics' do
  <<-"EOS"
  #{temperture}
  EOS
end

def temperture
  <<-"EOS"
  natureremo_temperture{appliance_name="#{JSON.parse(client.appliances.body)[0]["device"]["name"]}",
  appliance_id="#{JSON.parse(client.appliances.body)[0]["device"]["id"]}"} client.get_temp
  EOS
end

def client
  client ||= NatureRemo::Client.
               new(ENV['NATURE_TOKEN'])
end
