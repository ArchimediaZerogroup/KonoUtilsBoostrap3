require 'rails/generators'
module KonoUtilsBootstrapView3
  class InstallGenerator < Rails::Generators::Base
    desc "Installa l'inizializzatore"

    def self.source_root
      @source_root ||= File.expand_path('../../../templates', __FILE__)
    end

    def install_kono_utils
      run "rails g kono_utils:install"
    end

    def append_dependecy_to_assets
      requirements = [
        'jquery/dist/jquery',
        'kono_utils_bootstrap_view3/application'
      ]
      inject_into_file 'app/assets/javascripts/application.js',
                       "#{requirements.collect {|c| "\n//= require #{c}"}.join}\n",
                       before: "//= require_tree ."


      requirements=[
        'kono_utils_bootstrap_view3/application'
      ]
      inject_into_file 'app/assets/stylesheets/application.css',
                       "#{requirements.collect {|c| "\n *= require #{c}"}.join}\n",
                       before: " *= require_tree ."

    end

    def install_node_dependency
      yarn_packages = ["patternfly-bootstrap-treeview", "moment"]
      run "yarn add #{yarn_packages.join(' ')}"
    end

  end
end