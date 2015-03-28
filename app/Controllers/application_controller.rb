class ApplicationController < Sinatra::Base
  set :views, './app/Views/'
  set :static, true
  set :public_folder, './public/'
  helpers MainHelpers

end