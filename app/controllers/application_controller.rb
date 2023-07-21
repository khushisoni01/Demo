class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        if resource.is_a?(Account)
            posts_path
        end
    end
end
           