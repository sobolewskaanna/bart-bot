require 'sinatra'

get '/ping' do
  'pong'
end

post '/getaway' do
  message = params[:text].gsub(params[:trigger_word], '').strip
  action, _option = message.split(' ').map { |c| c.strip.downcase }

  case action
  when 'help'
    "Available commands: _'help'_, _'delays'_, _'elevator'_, _'departsouth'_, _'departnorth'_"
  when 'delays'
    'delays'
  when 'elevator'
    'elevator'
  when 'departnorth'
    'departnorth'
  when 'departsouth'
    'departsouth'
  end
end
