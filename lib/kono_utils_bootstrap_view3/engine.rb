module KonoUtilsBootstrapView3
  class Engine < ::Rails::Engine

    require 'kono_utils'
    require 'bootstrap3-datetimepicker-rails'
    require 'formtastic-bootstrap'
    require 'font-awesome-rails'
    require 'will_paginate-bootstrap'
    require 'will_paginate'


    initializer 'kono_utils_bootstrap_view.append_views', :before => 'kono_utils.append_views', :group => :all do |app|
      ActionController::Base.append_view_path KonoUtilsBootstrapView3::Engine.root.join("app", "views", "kono_utils")
      ActionController::Base.append_view_path KonoUtilsBootstrapView3::Engine.root.join("app", "views", "kono_utils", "base_editing")
    end

    initializer 'kono_utils_bootstrap_view.append_helpers',:after=>'kono_utils.append_helpers', :group => :all do |app|
      KonoUtils.configure do |c|
        c.application_helper_includes << KonoUtilsBootstrapView3::ApplicationHelper
        c.base_editing_helper_includes << KonoUtilsBootstrapView3::BaseEditingHelper
      end
    end

    initializer 'kono_utils_bootstrap_view.set_paginator', :group => :all do |app|
      KonoUtils.configure do |c|
        c.pagination_proxer = KonoUtilsBootstrapView3::PaginateProxer
      end
    end

  end
end
