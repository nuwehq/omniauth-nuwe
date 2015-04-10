# Sample app for Nuwe OAuth2 Strategy
# Make sure to setup the ENV variables APPLICATION_ID and CLIENT_SECRET
# Run with "bundle exec rackup"

require 'bundler/setup'
require 'sinatra/base'
require 'omniauth-nuwe'

class App < Sinatra::Base
  get '/' do
    redirect '/auth/nuwe'
  end

  get '/auth/:provider/callback' do
    content_type 'application/json'
    MultiJson.encode(request.env['omniauth.auth'])
  end

  get '/auth/failure' do
    content_type 'application/json'
    MultiJson.encode(request.env)
  end
end

use Rack::Session::Cookie, :secret => 'change_me'

use OmniAuth::Builder do
  provider :nuwe, ENV['APPLICATION_ID'], ENV['CLIENT_SECRET']
end

run App.new
