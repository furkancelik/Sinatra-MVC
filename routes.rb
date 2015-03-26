module MainApp

  class FrontEnd < Sinatra::Base
    #set views main folder
    set :views, settings.root + '/app/Views/frontend'

    get '/' do
      require './app/Controllers/user_controller.rb'
      UserController.index
    end

  end

  class BackEnd < Sinatra::Base
    #set views admin folder
    set :views, settings.root + '/app/Views/backend'

    get '/' do
      erb :"login/index", :layout => :index
    end


  end

end