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
  get "/" do
    "hello"
  end

  get "/matches/today.json" do
    TextWidget.new(ApiClient.new.matches(:today)).to_json
  end

  get "/matches/tomorrow.json" do
    TextWidget.new(ApiClient.new.matches(:tomorrow)).to_json
  end

  get "/matches/current.json" do
    current = ApiClient.new.matches(:current)
    if current.empty?
      {
        "item" => [
          { "text" => "No matches at the moment!", "type" => 1 }
        ]
      }.to_json
    else
      TextWidget.new(current).to_json
    end
  end

  get "/group" do
    ListWidget.new(ApiClient.new.group_results).to_json
  end
end
