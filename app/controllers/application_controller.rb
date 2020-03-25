class ApplicationController < ActionController::Base

    protected

    def after_sign_in_path_for(resource)
      if(current_user.admin == true )
        aeroplanes_path
      else
        search_path
      end
    end

end
