require 'rails/generators/test_case'
require 'generators/infobip/config/config_generator'

module Infobip
  module Generators
    class ConfigGeneratorTest < Rails::Generators::TestCase
      tests Infobip::Generators::ConfigGenerator
      destination File.expand_path(current_path, File.dirname(__FILE__))

      def test_copy_configuration
        run_generator
        assert_file "#{current_path}/config/initializers/infobip_config.rb"
        remove_dir "#{current_path}/config"
      end
    end
  end
end
