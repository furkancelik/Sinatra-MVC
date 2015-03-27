module Admin
  class ApplicationController < Sinatra::Base
    get '/' do
      "Admin Application controller"
    end

    get '/login' do
      "Admin Login Sayfası"
    end

  end
end
