class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        if resource.is_a?(Account)
        	if resource.role == 'basic_account'
                basic_account_path
            else
            	business_account_path
            end
        end
    end
end