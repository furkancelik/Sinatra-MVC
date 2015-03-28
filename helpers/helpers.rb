module Sinatra
  module ApplicationHelpers
    def load_controller(dir=File.dirname(__FILE__) + '/app/Controllers/*')
      Dir.glob(dir).each do |file|
        if File.directory? file then
          load_controller(file+'/*')
        else
          require file
        end
      end
    end
  end
  register ApplicationHelpers
end

