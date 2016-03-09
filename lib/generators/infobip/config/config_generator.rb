module Infobip
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def generate_config
        copy_file 'config.rb', 'config/initializers/infobip_config.rb'
      end
    end
  end
end