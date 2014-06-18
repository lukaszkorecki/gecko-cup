require 'rubygems'
require 'json'
require 'bundler'
require 'erb'

Bundler.setup
require 'faraday'

require 'sinatra'

require './api_client'
require './presenters'
require './widgets'

class App < Sinatra::Base
  get "/matches/today.json" do
    TextWidget.new(ApiClient.new.matches(:today)).to_json
  end
end
