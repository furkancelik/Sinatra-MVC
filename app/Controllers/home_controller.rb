class HomeController < ApplicationController
  get '/' do
    erb :'home/index', :layout => :'home/layout/index'
  end
end