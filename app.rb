require 'sinatra/activerecord'
require 'sinatra/base'

#Helpers File Autoload
Dir.glob('./helpers/*.rb').each do |h_file|
  require h_file
end

#Controllers File Autoload
Sinatra::Helpers::load_controller(File.dirname(__FILE__) + '/app/Controllers/*')

#Models File Autoload
Sinatra::Helpers::load_models(File.dirname(__FILE__) + '/app/Models/*')


module MainApp
  def self.const_missing(c)
    Object.const_get(c)
  end
end


# Create New Controller Namespace Append Code:

# module [ControllerFolderName]
#   extend MainApp
# end
