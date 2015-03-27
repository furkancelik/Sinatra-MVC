def load_controller(dir=File.dirname(__FILE__) + '/app/Controllers/*')
  Dir.glob(dir).each do |file|
    if File.directory? file then
     load_controller(file+'/*')
    else
      require file
    end
  end
end


load_controller


module MainApp
  def self.const_missing(c)
    Object.const_get(c)
  end
end


# Create New Controller Namespace Append Code:

# module [ControllerFolderName]
#   extend MainApp
# end

module Admin
  extend MainApp
end