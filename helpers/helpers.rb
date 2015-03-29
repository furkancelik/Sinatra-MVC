module Sinatra
  module Helpers
    def self.load_controller(dir=File.dirname(__FILE__) + '/app/Controllers/*')
      Dir.glob(dir).each do |file|
        if File.directory? file then
          load_controller(file+'/*')
        else
          require file
        end
      end
    end

    def self.load_models(dir=File.dirname(__FILE__) + '/app/Models/*')
      Dir.glob(dir).each do |file|
        if File.directory? file then
          load_controller(file+'/*')
        else
          require file
        end
      end
    end
  end
  register Helpers
end

