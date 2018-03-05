require 'sinatra'

get '/ping' do
  'pong'
end

post '/getaway' do
  message = params[:text].gsub(params[:trigger_word], '').strip
  action, _option = message.split(' ').map { |c| c.strip.downcase }

  case action
  when 'help'
    respond_message(help)
  when 'delays'
    respond_message(get_delays)
  when 'elevator'
    respond_message(get_elevator_closures)
  when 'depart north'
    respond_message(get_departures(_option))
  when 'depart south'
    respond_message(get_departures(_option))
  end
end

def respond_message(message)
  content_type :json
  { text: message }.to_json
end