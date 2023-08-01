# class ApplicationController < ActionController::Base
#     def after_sign_in_path_for(resource)
#         if resource.is_a?(Account)
#             posts_path
#         end

#         if resource.is_a?(AdminUser) 
#             admin_dashboard_path(resource)
#         end      
#     end 

# end



class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.is_a?(Account)
      posts_path
    elsif resource.is_a?(AdminUser)
      admin_dashboard_path(resource)
    end
  end
end

           