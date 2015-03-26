require 'sinatra'
require './app'
require File.join(File.dirname(__FILE__), 'app.rb')

disable :run

set :environment, :development

map "/" do
  run MainApp::FrontEnd
end

map "/admin" do
  run MainApp::BackEnd
end