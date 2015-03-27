require 'sinatra'
require './app'
require File.join(File.dirname(__FILE__), 'app.rb')

disable :run

set :environment, :development

map "/" do
  Dir.glob(File.dirname(__FILE__) + '/app/Controllers/*.rb').each do |file|
    x = file[(File.dirname(__FILE__) + '/app/Controllers/').length,file.length].chomp(".rb").split('_').map {|w| w.capitalize}.join
    use Object.const_get("MainApp").const_get(x)
    end
  run MainApp::ApplicationController
end

Dir.glob(File.dirname(__FILE__) + '/app/Controllers/*').each do |file|
  if File.directory? file then
    folder = file[(File.dirname(__FILE__) + '/app/Controllers/').length,file.length]
    map '/'+folder.downcase()+'' do
      Dir.glob(File.dirname(__FILE__) + '/app/Controllers/'+folder+'/*.rb').each do |file|
        x = file[(File.dirname(__FILE__) + '/app/Controllers/'+folder+'/').length,file.length].chomp(".rb").split('_').map {|w| w.capitalize}.join
        use Object.const_get(folder).const_get(x)
      end
      run Object.const_get(folder).const_get("ApplicationController")
    end

  end
end